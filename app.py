from flask import Flask, jsonify, request,session,send_from_directory
from flask_cors import CORS, cross_origin
from flask_mysqldb import MySQL
import json,random,csv,io,ast
from datetime import datetime
from werkzeug.utils import secure_filename
import os
from emailer import send_templated_email




app = Flask(__name__)

app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'labguard'
app.config['SECRET_KEY'] = 'labguardsecretkey'
CORS(app, origins="*",supports_credentials=True)
mysql = MySQL(app)

current_user = None


UPLOAD_FOLDER = "uploads"
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

@app.route('/uploads/<filename>')
def uploaded_file(filename):
    return send_from_directory(UPLOAD_FOLDER, filename)


@app.route("/upload_profile_image", methods=["POST"])
@cross_origin(supports_credentials=True)
def upload_profile_image():
    global current_user
    if not current_user:
        return jsonify({"success": False, "message": "Not logged in"}), 401

    if "image" not in request.files:
        return jsonify({"success": False, "message": "No file uploaded"}), 400

    file = request.files["image"]
    if file.filename == "":
        return jsonify({"success": False, "message": "No file selected"}), 400

 
    filename = secure_filename(file.filename)
    filepath = os.path.join(UPLOAD_FOLDER, filename)
    file.save(filepath)

    cursor = mysql.connection.cursor()
    cursor.execute(
        "UPDATE users SET profile=%s WHERE lgid=%s",
        (filename, current_user['lgid'])
    )
    mysql.connection.commit()
    cursor.close()

    return jsonify({"success": True, "image_url": f"http://127.0.0.1:5000/uploads/{filename}"})


@app.route("/update_profile", methods=["POST"])
@cross_origin(supports_credentials=True)
def update_profile():
    global current_user
    if not current_user:
        return jsonify({"success": False, "message": "Not logged in"}), 401

    data = request.get_json()
    name = data.get("name")
    email = data.get("email")
    department = data.get("department")
    position = data.get("position")
    new_password = data.get("newPassword")
    current_password = data.get("currentPassword")
    image_filename = data.get("image")  

    if image_filename and "/" in image_filename:
        image_filename = image_filename.split("/")[-1]

    cursor = mysql.connection.cursor()

    if new_password:
        cursor.execute("SELECT password FROM users WHERE lgid=%s", (current_user['lgid'],))
        stored_pw = cursor.fetchone()[0]
        if stored_pw != current_password:
            cursor.close()
            return jsonify({"success": False, "message": "Current password is incorrect"}), 401

        cursor.execute(
            "UPDATE users SET password=%s WHERE lgid=%s",
            (new_password, current_user['lgid'])
        )

    cursor.execute(
        "UPDATE users SET name=%s, email=%s, department=%s, position=%s, profile=%s WHERE lgid=%s",
        (name, email, department, position, image_filename, current_user['lgid'])
    )
    mysql.connection.commit()
    cursor.close()

    return jsonify({"success": True, "message": "Profile updated successfully"})


@app.route("/get_user")
@cross_origin(supports_credentials=True)
def get_user():
    global current_user
    if not current_user:
        return jsonify({"error": "Not logged in"}), 401

    cursor = mysql.connection.cursor()
    cursor.execute(
        "SELECT lgid, name, email, role, year, password, profile, department, position "
        "FROM users WHERE lgid=%s",
        (current_user['lgid'],)
    )
    profile = cursor.fetchone()
    cursor.close()

    if profile:
        filename = profile[6]  
        if filename:
            image_url = f"http://127.0.0.1:5000/uploads/{filename}"
        else:
            image_url = "/img/default.png"

        userProfile = {
            "lgid": profile[0],
            "name": profile[1],
            "email": profile[2],
            "role": profile[3],
            "year": profile[4],
            "password": profile[5],
            "image": image_url,
            "department": profile[7],
            "position": profile[8],
        }
        return jsonify(userProfile)

    return jsonify({"error": "User not found"}), 404



@app.route('/delete_user/<email>', methods=['DELETE'])
def delete_user(email):
    try:
        cursor = mysql.connection.cursor()
        cursor.execute("DELETE FROM users WHERE email = %s", (email,))
        mysql.connection.commit()
        cursor.close()
        return {"message": f"User with email {email} deleted successfully"}, 200
    except Exception as e:
        return {"error": str(e)}, 500
    
@app.route('/delete_report/<id>', methods=['DELETE'])
def delete_report(id):
    if id == "ALL":
        try:
            cursor = mysql.connection.cursor()
            cursor.execute("DELETE FROM reports")
            mysql.connection.commit()
            cursor.close()
            return {"message": f"Deleted successfully"}, 200
        except Exception as e:
            return {"error": str(e)}, 500
    else:
        try:
            cursor = mysql.connection.cursor()
            cursor.execute("DELETE FROM reports WHERE id = %s", (id,))
            mysql.connection.commit()
            cursor.close()
            return {"message": f"Deleted successfully"}, 200
        except Exception as e:
            return {"error": str(e)}, 500
        
@app.route('/delete_lab/<string:lab_name>', methods=['DELETE'])
def delete_lab(lab_name):
    try:
        cursor = mysql.connection.cursor()
        cursor.execute("DELETE FROM laboratory WHERE lab_name = %s", (lab_name,))
        mysql.connection.commit()
        cursor.execute("DELETE FROM computer_equipments WHERE lab_name = %s", (lab_name,))
        mysql.connection.commit()
        cursor.close()
        return {"message": "Lab deleted"}, 200
    except Exception as e:
        return {"error": str(e)}, 500
        
@app.route('/delete_computer/<string:id>', methods=['DELETE'])
def delete_computer(id):
    try:
        cursor = mysql.connection.cursor()
        cursor.execute("DELETE FROM computer_equipments WHERE id = %s", (id,))
        mysql.connection.commit()
        cursor.close()
        return {"message": "Lab deleted"}, 200
    except Exception as e:
        return {"error": str(e)}, 500

@app.route("/edit_lab/<lab_id>", methods=["PUT"])
def edit_lab(lab_id):
    try:
        data = request.get_json()
        print(data)
        new_lab_name = data.get("lab_name")
        location = data.get("location")

        cursor = mysql.connection.cursor()
        cursor.execute(
            "UPDATE laboratory SET lab_name=%s, location=%s WHERE lab_id=%s",
            (new_lab_name, location, lab_id)
        )
        mysql.connection.commit()
        cursor.execute(
            "UPDATE computer_equipments SET lab_name=%s WHERE lab_id=%s",
            (new_lab_name, lab_id)
        )
        mysql.connection.commit()
        cursor.close()

        return jsonify({"success": True, "message": "Lab updated successfully"}), 200

    except Exception as e:
        print("Error:", e)
        return jsonify({"success": False, "message": str(e)}), 400

@app.route('/login', methods=['POST'])
@cross_origin()
def login():
    global current_user
    try:
        data = request.json.get('data')
        email = data.get('email')
        password = data.get('password')

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT lgid, name, email, role, year, password FROM users WHERE email = %s", (email,))
        user = cursor.fetchone()
        cursor.close()
        
        if not user:
            return jsonify({"msg": "User not found"}), 404

        user_id, name, email, role, year, stored_pw = user

        if stored_pw != password:
            return jsonify({"msg": "Invalid credentials"}), 401
        
        current_user = {
            "lgid": user_id,
            "name": name,
            "email": email,
            "role": role,
            "year": year
        }

        return jsonify({
            "msg": "Login successful",
            "user": {
                "lgid": user_id,
                "name": name,
                "email": email,
                "role": role, 
                "year": year
            }
        }), 200
    except Exception as e:
        print("Error in login:", e)
        return jsonify({"msg": str(e)}), 500

@app.route('/add_report', methods=['POST'])
@cross_origin()
def add_report():
    
    email = request.headers.get("X-User-Email")
    report = request.json.get('data')
    print(report)
    lab = report['lab']
    item = report['item']
    label = report['label']
    quantity = report['quantity']
    status = report['status']
    notes = report['notes']

    cursor = mysql.connection.cursor()
    cursor.execute("INSERT INTO reports (lab,item,quantity,status,notes,submitted_by,label) VALUES (%s,%s,%s,%s,%s,%s,%s)",
                   ( lab, item, quantity, status, notes, email,label))
    mysql.connection.commit()
    cursor.close()

    return {"report": "added succesfully"}




    

@app.route('/add_laboratory', methods=['POST'])
def add_laboratory():
    data = request.json.get('data')

    lab_name = data.get('lab_name')
    location = data.get('location')

    cursor = mysql.connection.cursor()

    cursor.execute("INSERT INTO laboratory (lab_name, location) VALUES (%s,%s)",(lab_name,location,))
    mysql.connection.commit()

    new_id = cursor.lastrowid


    return {
        "id": new_id,
        "name": lab_name,
        "location": location
    }
@app.route('/get_data')
def get_data():
    cursor = mysql.connection.cursor()

    # --- Fetch tables ---
    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()  # user_id, name, ..., has_voted

    cursor.execute("SELECT * FROM laboratory")
    laboratories = cursor.fetchall()  # lab_id, lab_name, location

    cursor.execute("SELECT * FROM computer_equipments")
    computer_equipments = cursor.fetchall()  # id, lab_name, pc_name

    cursor.execute("SELECT * FROM computer_status")
    computer_status = cursor.fetchall()  # com_id, hdmi, headphone, keyboard, monitor, mouse, power, systemUnit, wifi, status_id

    cursor.execute("SELECT * FROM reports")
    reports = cursor.fetchall()  # id, user_id, com_id, date, notes

    # --- Summary stats ---
    total_users = len(users)
    active_users = sum(1 for u in users if u[4] not in ("0", None))  # adjust index for has_voted
    inactive_users = total_users - active_users

    total_labs = len(laboratories)
    total_computers = len(computer_equipments)

    # Overall operational stats
    operational = not_operational = damaged = missing = 0
    for status in computer_status:
        for s in status[1:9]:  # exclude com_id and status_id
            val = str(s).lower()
            if val == "operational":
                operational += 1
            elif val == "notoperational":
                not_operational += 1
            elif val == "damaged":
                damaged += 1
            elif val == "missing":
                missing += 1

    reports_submitted = len(reports)

    # --- Computer parts status ---
    parts = ["wifi","headphone","keyboard","hdmi","monitor","mouse","power","systemUnit"]
    computerPartStatus = []
    for i, part in enumerate(parts):
        operational_count = sum(1 for row in computer_status if str(row[i+1]).lower() == "operational")
        not_op_count = sum(1 for row in computer_status if str(row[i+1]).lower() == "notoperational")
        damaged_count = sum(1 for row in computer_status if str(row[i+1]).lower() == "damaged")
        missing_count = sum(1 for row in computer_status if str(row[i+1]).lower() == "missing")
        computerPartStatus.append({
            "name": part,
            "operational": operational_count,
            "notOperational": not_op_count,
            "damaged": damaged_count,
            "missing": missing_count
        })

    # --- Labs & Computers and Damage vs Missing ---
    labEquipments = []
    damageMissing = []

    for lab in laboratories:
        lab_id, lab_name, location = lab
        total = sum(1 for comp in computer_equipments if comp[1] == lab_name)

        damaged_count = 0
        missing_count = 0
        for comp in computer_equipments:
            if comp[1] == lab_name:
                comp_id = comp[0]
                for status in computer_status:
                    if status[0] == comp_id:
                        vals = [str(x).lower() for x in status[1:9]]
                        damaged_count += vals.count("damaged")
                        missing_count += vals.count("missing")

        # Use "name" as key to match React
        labEquipments.append({
            "name": lab_name,
            "computers": total
        })

        damageMissing.append({
            "name": lab_name,
            "damaged": damaged_count,
            "missing": missing_count
        })

    cursor.close()

    # --- Print debug info ---
    print("labEquipments:", labEquipments)
    print("damageMissing:", damageMissing)

    return jsonify({
        "stats": {
            "totalLabs": total_labs,
            "totalComputers": total_computers,
            "operational": operational,
            "notOperational": not_operational,
            "totalUsers": total_users,
            "activeUsers": active_users,
            "inactiveUsers": inactive_users,
            "reportsSubmitted": reports_submitted,
            "damaged": damaged,
            "missing": missing,
        },
        "computerPartStatus": computerPartStatus,
        "labEquipments": labEquipments,
        "damageMissing": damageMissing
    })

@app.route('/get_laboratory', methods=['GET'])
def get_laboratory():
    final_data = []
    cursor = mysql.connection.cursor()

    cursor.execute("SELECT * FROM laboratory")
    data = cursor.fetchall()

    for i in data:
        labs = {
            "lab_id": i[0],
            "name" : i[1],
            "location" : i[2]
        }

        final_data.append(labs)

    return final_data



@app.route('/get_computers', methods=['GET'])
def get_computers():
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT id, pc_name, lab_name, specs FROM computer_equipments")
        rows = cur.fetchall()
        cur.close()

        computers = []
        for row in rows:
            computers.append({
                "id": row[0],
                "pcNumber": row[1],
                "lab": row[2],
                "parts": json.loads(row[3]) if row[3] else {}
            })

        print(computers)

        return jsonify(computers)
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
@app.route('/get_computer_statuses')
def get_computer_statuses():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM computer_status")
    rows = cur.fetchall()
    cur.close()

    statuses = []
    for row in rows:
        statuses.append({
            "com_id": row[0],
            "hdmi": row[1],
            "headphone": row[2],
            "keyboard": row[3],
            "monitor": row[4],
            "mouse": row[5],
            "power": row[6],
            "systemUnit": row[7],
            "wifi": row[8],
            "status_id": row[9]
        })

    return jsonify(statuses)
        
    
    

@app.route('/update_computer_status', methods=['POST'])
def update_status():
    data = request.json
    print(data)
    comp_id = data.get("compId")
    statuses = data.get("statuses", {})

    cursor = mysql.connection.cursor()

    for part, status in statuses.items():
        query = f"UPDATE computer_status SET {part} = %s WHERE com_id = %s"
        cursor.execute(query, (status, comp_id))

    mysql.connection.commit()
    cursor.close()
    return jsonify({"success": True})


@app.route('/computer', methods=['POST'])
def add_computer():
    try:
        data = request.json.get('data')
        lab_id = data.get('id')
        pc_name = data.get('name')
        lab_name = data.get('lab_name')
        spec = data.get('spec')

        random_id = str(random.randint(11111111, 99999999))
        status_id = str(random.randint(11111111, 99999999))

        cur = mysql.connection.cursor()

        cur.execute(
            "INSERT INTO computer_equipments (pc_name, lab_name, specs, id,lab_id) VALUES (%s, %s, %s, %s,%s)",
            (pc_name, lab_name, spec, random_id,lab_id)
        )
        
        mysql.connection.commit()

        cur.execute(
            "INSERT INTO computer_status (com_id, status_id) VALUES (%s, %s)",
            (random_id, status_id)
        )
        mysql.connection.commit()

        cur.close()

        return jsonify({
            "id": random_id,
            "pcNumber": pc_name,
            "lab": lab_name,
            "parts": json.loads(spec)
        })

    except Exception as e:
        print(e)
        return jsonify({"error": str(e)}), 500
    
@app.route('/computer/bulk',methods=['POST'])
def computer_bulk():
    comp_id = ''
    pc_name = ''
    lab_name= ''
    spec = None
    data = request.json.get('data')
    print(data)
    for computer in data:
        print(computer)
        try:
            pc_name = computer['pc_name']
            print(pc_name)
            lab_name = computer['lab_name']
            spec = computer['specs']
            id = random.randint(11111111, 99999999)
            cur = mysql.connection.cursor()
            cur.execute(
                "INSERT INTO computer_equipments (pc_name, lab_name, specs,id) VALUES (%s, %s, %s,%s)",
                (pc_name, lab_name, spec,str(id))
            )
            mysql.connection.commit()
            comp_id = cur.lastrowid
            id_status = random.randint(11111111, 99999999)
            cur.execute('INSERT INTO computer_status (com_id, status_id) VALUES (%s, %s)',(str(id),str(id_status)))
            mysql.connection.commit()
            
            cur.close()

            
        except Exception as e:
            return jsonify({"error": str(e)}), 500
    
    return jsonify({
        "id": comp_id,
        "pcNumber": pc_name,
        "lab": lab_name,
        "parts": json.loads(spec)
    })

      
    

@app.route('/get_admin_computer_reports')
def get_admin_computer_reports():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM computer_status")
    rows = cur.fetchall()

    reports = []
    for row in rows:
        com_id, hdmi, headphone, keyboard, monitor, mouse, power, systemUnit, wifi, status_id = row

        parts = {
            "hdmi": hdmi,
            "headphone": headphone,
            "keyboard": keyboard,
            "monitor": monitor,
            "mouse": mouse,
            "power": power,
            "systemUnit": systemUnit,
            "wifi": wifi,
        }

        for part, status in parts.items():
            if status != "operational":
                cur.execute(
                    "SELECT lab_name, pc_name FROM computer_equipments WHERE id = %s",
                    (com_id,)
                )
                result = cur.fetchone()
                if not result:
                    continue
                lab_name, pc_name = result
                notes = f"{part} issue detected"
                cur.execute(
                    "SELECT * FROM reports WHERE com_id = %s AND notes = %s",
                    (com_id,notes,)
                )
                report_fetch = cur.fetchone()
                if report_fetch:
                    report = {
                        "id": report_fetch[1],
                        "item": pc_name,
                        "lab": lab_name,
                        "status": report_fetch[3],
                        "date": report_fetch[7].isoformat(),
                        "notes": report_fetch[6],
                    }
                    reports.append(report)
                    continue
                report_date = datetime.now()
                report = {
                    "id": status_id,
                    "item": pc_name,
                    "lab": lab_name,
                    "status": status.capitalize(),
                    "date": report_date.isoformat(),
                    "notes": f"{part} issue detected",
                }
                

                cur.execute(
                    """
                    INSERT INTO reports (com_id, lab, status, created_at, notes)
                    VALUES (%s, %s, %s, %s, %s)
                    """,
                    (com_id, lab_name, report["status"], report_date, report["notes"])
                )

    mysql.connection.commit()
    cur.close()
    reports.sort(key=lambda x: datetime.fromisoformat(x["date"]), reverse=True)
    return jsonify(reports)





@app.route('/get_accessories', methods=["GET"])
def get_accessories():
    final_data = []
    cursor = mysql.connection.cursor()

    cursor.execute("SELECT * FROM accessories_equipment")
    data = cursor.fetchall()

    for i in data:
        computer = {
            "id" : i[2],
            "name" : i[3],
            "spec" : i[0],
            "lab" : i[1]
        }

        final_data.append(computer)

    return final_data

@app.route('/add_accessories', methods=["POST"])
def add_accessories():
    data = request.json.get('data')
    
    name = data.get('name')
    lab_name = data.get('lab_name')
    spec = data.get('spec')
    cursor = mysql.connection.cursor()

    cursor.execute("INSERT INTO accessories_equipment (spec,lab,name) VALUES (%s,%s,%s)",(spec,lab_name,name))
    mysql.connection.commit()

    return "success"

@app.route("/labs-pc-count", methods=["GET"])
def labs_pc_count():
    try:
        cur = mysql.connection.cursor()
        cur.execute(
            "SELECT lab_name, COUNT(pc_name) FROM computer_equipments GROUP BY lab_name"
        )
        rows = cur.fetchall()
        cur.close()
        lab_counts = [{"lab_name": lab, "count": count} for lab, count in rows]
        print(lab_counts)
        return jsonify(lab_counts)
        
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route('/send_report_email',methods= ['POST'])
def send_report_email():
    title = request.json.get('title')
    summary = request.json.get('summary')
    position = request.json.get('position')
    userEmail = request.json.get('userEmail')
    context = {
        "title":title,
        "summary":summary,
        'recipient': ["justindelavega00@gmail.com","juag.delavega.ui@phinmaed.com"],
        "position":position,
        "userEmail": userEmail
    }

    send_templated_email(
        sender_email='claims.pui@gmail.com',
        sender_password='vxdk puti kyhc mdkr',
        receiver_email=context['recipient'],
        subject=f"System Report - {context['title']}",
        template_name='report.html',
        context=context
    )
    return {"message": "Email send succesfully"}


@app.route('/submit_technician_report', methods=['POST'])
def submit_technician_report():
    report_id = request.json.get('report_id')
    issue_found = request.json.get('issue_found')
    solution = request.json.get('solution')
    status = request.json.get('status')
    technician_email = request.json.get('technician_email')
    part = issue_found['notes'].split()[0]
    cur = mysql.connection.cursor()
    fix_id = str(random.randint(11111111,99999999))
    cur.execute("INSERT INTO technician_logs (report_id, fix_id, issue_found, solution, status, technician_email) VALUES (%s,%s,%s,%s,%s,%s)",(report_id,fix_id,issue_found,solution,status,technician_email))
    mysql.connection.commit()

    cur.execute(f"UPDATE computer_status set {part} = %s WHERE com_id = %s",(status,report_id))
    mysql.connection.commit()
    print(report_id,issue_found['notes'])
    cur.execute("DELETE FROM reports WHERE com_id = %s AND notes = %s",(report_id,issue_found['notes']))
    mysql.connection.commit()
    print({
        "report_id": report_id,
        "issue_found": issue_found,
        "solution": solution,
        "status": status,
        "technician_email": technician_email,
        "part": part
    })
    return {"message": "report submitted successfully"}

@app.route('/get_technician_logs')
def get_technician_logs():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM technician_logs")
    rows = cur.fetchall()
    cur.close()

    logs = []
    for row in rows:
        issue = ast.literal_eval(row[2])
        logs.append({
            "report_id": row[0],
            "fix_id": row[1],
            "issue_found":issue,
            "isssolution_made": row[3],
            "status": row[4],
            "technician_email": row[5],
            "timestamp": row[6].isoformat()
        })

    return jsonify(logs)


@app.route('/technician_send_report_email',methods= ['POST'])
def technician_send_report_email():
    data = request.json.get('data')
    print(data)
    context = {
        "title":data['title'],
        "summary":data['issue_report'],
        'recipient': ["justindelavega00@gmail.com","juag.delavega.ui@phinmaed.com"],
        "position":data['position'],
        "userEmail": data['userEmail']
    }

    send_templated_email(
        sender_email='claims.pui@gmail.com',
        sender_password='vxdk puti kyhc mdkr',
        receiver_email=context['recipient'],
        subject=f"Tecnician Logs - {context['title']}",
        template_name='technician.html',
        context=context
    )
    return {"message": "Email send succesfully"}


@app.route("/check_session")
def check_session():
    global current_user
    if current_user:
        print("Current user:",current_user)
        return {"logged_in": True, "user": current_user}
    return {"logged_in": False}
    
@app.route("/logout")
def logout():
    global current_user
    current_user = None
    session.pop("user", None)
    return {"message": "Logged out"}

if __name__ == '__main__':
    app.run(debug=True)