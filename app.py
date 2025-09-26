from flask import Flask, jsonify, request,session
from flask_cors import CORS, cross_origin
from flask_mysqldb import MySQL
import json,random
from datetime import datetime

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'labguard'
app.config['SECRET_KEY'] = 'labguardsecretkey'
CORS(app, origins="*")
mysql = MySQL(app)

@app.route('/get_users')
def get_users():
    users = []
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM users")
    data = cursor.fetchall()
    for profile in data:
        userProfile =    {
                "lgid": profile[0],
                "name": profile[1],
                "email": profile[2],
                "role": profile[3],
                "year": profile[4],
                "password": profile[5]
            }
        users.append(userProfile)

    return users

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
        
@app.route('/delete_lab/<int:id>', methods=['DELETE'])
def delete_lab(id):
    try:
        cursor = mysql.connection.cursor()
        cursor.execute("DELETE FROM laboratory WHERE id = %s", (id,))
        mysql.connection.commit()
        cursor.close()
        return {"message": "Lab deleted"}, 200
    except Exception as e:
        return {"error": str(e)}, 500
        






@app.route('/login', methods=['POST'])
@cross_origin()
def login():
    try:
        data = request.json.get('data')
        email = data.get('email')
        password = data.get('password')

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT lgid, name, email, role, year, password FROM users WHERE email = %s", (email,))
        user = cursor.fetchone()
        cursor.close()
        session['user'] = user
        current_user = user
        if not user:
            return jsonify({"msg": "User not found"}), 404

        user_id, name, email, role, year, stored_pw = user

        if stored_pw != password:
            return jsonify({"msg": "Invalid credentials"}), 401

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

@app.route('/get_data')
def get_data():
    cursor = mysql.connection.cursor()

    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()

    cursor.execute("SELECT * FROM laboratory")
    laboratories = cursor.fetchall()

    cursor.execute("SELECT * FROM computer_equipments")
    computer_equipments = cursor.fetchall()

    cursor.execute("SELECT * FROM reports")
    reports = cursor.fetchall()

    cursor.execute("SELECT * FROM computer_status")
    rows = cursor.fetchall()

    reports_sub = []
    for row in rows:
        com_id      = row[0]
        hdmi        = row[1]
        headphone   = row[2]
        keyboard    = row[3]
        monitor     = row[4]
        mouse       = row[5]
        power       = row[6]
        systemUnit  = row[7]
        wifi        = row[8]
        status_id   = row[9]

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
                cursor.execute(
                    "SELECT lab_name, pc_name FROM computer_equipments WHERE id = %s",
                    (com_id,)
                )
                lab_name, pc_name = cursor.fetchone()   

                report_sub = {
                    "id": status_id,
                    "item": pc_name,                
                    "lab": lab_name,
                    "status": status.capitalize(),
                    "date": datetime.now().isoformat(),
                    "notes": f"{part} issue detected",
                }
                reports_sub.append(report_sub)

    cursor.execute("SELECT * FROM computer_status")
    computer_status = cursor.fetchall()

    total_users = len(users)
    active_users = sum(1 for u in users if u[4] not in ("0", None))
    inactive_users = total_users - active_users

    total_labs = len(laboratories)
    total_computers = len(computer_equipments)

    operational = 0
    not_operational = 0
    damaged = 0
    missing = 0
    for status in computer_status:
        for s in status[1:]:
            val = str(s).lower()
            if val == "operational":
                operational += 1
            elif val == "notoperational":
                not_operational += 1
            elif val == "damaged":
                damaged += 1
            elif val == "missing":
                missing += 1

    reports_submitted = len(reports_sub)

    lab_equipments = []
    for lab in laboratories:
        lab_name, lab_room = lab
        total = sum(1 for comp in computer_equipments if comp[1] == lab_name)

        damaged_count = 0
        missing_count = 0
        for comp in computer_equipments:
            if comp[1] == lab_name:
                comp_id = comp[3]
                for status in computer_status:
                    if status[0] == comp_id:
                        vals = [str(x).lower() for x in status[1:]]
                        damaged_count += vals.count("damaged")
                        missing_count += vals.count("missing")

        lab_equipments.append({
            "lab": lab_name,
            "total": total,
            "damaged": damaged_count,
            "missing": missing_count
        })

    equipment_damage_stats = []
    for comp in computer_equipments:
        comp_name = comp[1]
        comp_id = comp[3]
        damaged_count = 0
        missing_count = 0
        for status in computer_status:
            if status[0] == comp_id:
                vals = [str(x).lower() for x in status[1:]]
                damaged_count += vals.count("damaged")
                missing_count += vals.count("missing")
        if damaged_count > 0 or missing_count > 0:
            equipment_damage_stats.append({
                "name": comp_name,
                "damaged": damaged_count,
                "missing": missing_count
            })

    parts = ["wifi","headphone","keyboard","hdmi","monitor","mouse","power","systemUnit"]
    computer_part_status = []
    for part in parts:
        operational_count = sum(1 for row in computer_status if str(row[parts.index(part)+1]).lower() == "operational")
        not_op_count = sum(1 for row in computer_status if str(row[parts.index(part)+1]).lower() == "notoperational")
        damaged_count = sum(1 for row in computer_status if str(row[parts.index(part)+1]).lower() == "damaged")
        missing_count = sum(1 for row in computer_status if str(row[parts.index(part)+1]).lower() == "missing")

        computer_part_status.append({
            "name": part,
            "operational": operational_count,
            "notOperational": not_op_count,
            "damaged": damaged_count,
            "missing": missing_count
        })

    cursor.close()

    return {
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
        "labEquipments": lab_equipments,
        "equipmentDamageStats": equipment_damage_stats,
        "computerPartStatus": computer_part_status,
    }



    

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

@app.route('/get_laboratory', methods=['GET'])
def get_laboratory():
    final_data = []
    cursor = mysql.connection.cursor()

    cursor.execute("SELECT * FROM laboratory")
    data = cursor.fetchall()

    for i in data:
        labs = {
           
            "name" : i[0],
            "location" : i[1]
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
        pc_name = data.get('name')
        lab_name = data.get('lab_name')
        spec = data.get('spec')
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

        return jsonify({
            "id": comp_id,
            "pcNumber": pc_name,
            "lab": lab_name,
            "parts": json.loads(spec)
        })
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    


      
    

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

                report_date = datetime.now()
                report = {
                    "id": status_id,
                    "item": pc_name,
                    "lab": lab_name,
                    "status": status.capitalize(),
                    "date": report_date.isoformat(),
                    "notes": f"{part} issue detected",
                }
                reports.append(report)

                cur.execute(
                    """
                    INSERT INTO reports (com_id, lab, status, created_at, notes)
                    VALUES (%s, %s, %s, %s, %s)
                    """,
                    (com_id, lab_name, report["status"], report_date, report["notes"])
                )

    mysql.connection.commit()
    cur.close()
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

        lab_counts = [{"lab": lab, "count": count} for lab, count in rows]

        return jsonify(lab_counts)

    except Exception as e:
        print("DB error:", e)
        return jsonify({"error": str(e)}), 500


    
if __name__ == '__main__':
    app.run(debug=True)
