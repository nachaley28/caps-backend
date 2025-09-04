from flask import Flask, jsonify, request,session
from flask_cors import CORS, cross_origin
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'labguard'
app.config['SECRET_KEY'] = 'labguardsecretkey'
CORS(app, origins="*")
mysql = MySQL(app)

@app.route('/signup', methods=['POST'])
@cross_origin()
def signup():
    try:
        data = request.json.get('data')
        name = data.get('name')
        email = data.get('email')
        role = data.get('role')  
        year = data.get('year')
        password = data.get('password')

        cursor = mysql.connection.cursor()
        cursor.execute("INSERT INTO users (name, email, role, year, password) VALUES (%s,%s,%s,%s,%s)",
                       (name, email, role, year, password))
        mysql.connection.commit()
        cursor.close()

        return jsonify({"msg": "Signup successful"}), 201
    except Exception as e:
        print("Error in signup:", e)
        return jsonify({"msg": str(e)}), 500

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
        print("The current user is", current_user)
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
                "role": role,  # Matches frontend roles exactly
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

@app.route('/get_reports', methods=['GET'])
@cross_origin()
def get_reports():
    try:
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM reports ORDER BY timestamp DESC")
        rows = cursor.fetchall()
        col_names = [desc[0] for desc in cursor.description]
        cursor.close()

        reports = [dict(zip(col_names, row)) for row in rows]



        return jsonify(reports), 200
    except Exception as e:
        print("Error fetching reports:", e)
        return jsonify({"error": str(e)}), 500

@app.route('/dashboard_data', methods=['GET'])
@cross_origin()
def dashboard_data():
    cursor = mysql.connection.cursor()

    cursor.execute("SELECT COUNT(*) FROM reports")
    total_submitted = cursor.fetchone()[0]

    cursor.execute("""
        SELECT item, COUNT(*) as count 
        FROM reports 
        WHERE status = 'Damaged'
        GROUP BY item
    """)
    damaged = [{"item": row[0], "count": row[1]} for row in cursor.fetchall()]

    cursor.execute("""
        SELECT item, COUNT(*) as count 
        FROM reports 
        WHERE status = 'Missing'
        GROUP BY item
    """)
    missing = [{"item": row[0], "count": row[1]} for row in cursor.fetchall()]

    cursor.execute("""
        SELECT lab,
               SUM(CASE WHEN status = 'Damaged' THEN 1 ELSE 0 END) as damaged,
               SUM(CASE WHEN status = 'Missing' THEN 1 ELSE 0 END) as missing
        FROM reports
        GROUP BY lab
    """)
    lab_damage = [{"lab": row[0], "damaged": row[1], "missing": row[2]} for row in cursor.fetchall()]

    cursor.execute("""
        SELECT status, COUNT(*) 
        FROM reports
        GROUP BY status
    """)
    operational_stats = [{"label": row[0], "count": row[1]} for row in cursor.fetchall()]

    cursor.execute("""
        SELECT item, lab, COUNT(*) as count, status
        FROM reports
        GROUP BY item, lab, status
    """)
    icon_map = {
        "Laptop": "laptop",
        "Desktop": "desktop",
        "Plug": "plug",
        "Projector": "video"
    }
    inventory = [{
        "title": row[0],
        "icon": icon_map.get(row[0], "desktop"),
        "count": row[2],
        "location": row[1],
        "status": row[3]
    } for row in cursor.fetchall()]

    cursor.close()

    return jsonify({
        "totalSubmitted": total_submitted,
        "damaged": damaged,
        "missing": missing,
        "labDamage": lab_damage,
        "inventory": inventory,
        "operational_stats": operational_stats
    })

@app.route('/get_inventory', methods=["GET"])
@cross_origin()
def get_inventory():
    email = request.headers.get("X-User-Email")
    role = request.headers.get("X-User-Id")
    final_data = []
    # user = session.get('user')
    print(email,role)
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM inventory")
    data = cursor.fetchall()
    for  result in data:
        item = {
            
            'id' : result[0],
            'category' : result[1],
            'name' : result[2],
            'lab' : result[3],
            'specs' : result[4],
            'quantity' : result[5],
            'status': result[6]
        }
        final_data.append(item)
    
    return final_data

@app.route('/add_laboratory', methods=['POST'])
def add_laboratory():
    data = request.json.get('data')

    lab_name = data.get('lab_name')
    location = data.get('location')

    cursor = mysql.connection.cursor()

    cursor.execute("INSERT INTO laboratory (lab_name, location) VALUES (%s,%s)",(lab_name,location,))
    mysql.connection.commit()

    return "success"

@app.route('/get_laboratory', methods=['GET'])
def get_laboratory():
    final_data = []
    cursor = mysql.connection.cursor()

    cursor.execute("SELECT * FROM laboratory")
    data = cursor.fetchall()

    for i in data:
        labs = {
            "id" : i[0],
            "name" : i[1],
            "location" : i[2]
        }

        final_data.append(labs)

    return final_data

@app.route('/get_computer', methods=["GET"])
def get_computer():
    final_data = []
    cursor = mysql.connection.cursor()

    cursor.execute("SELECT * FROM computer_equipments")
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

@app.route('/add_computer', methods=["POST"])
def add_computer():
    data = request.json.get('data')
    
    name = data.get('name')
    lab_name = data.get('lab_name')
    spec = data.get('spec')
    print(lab_name)
    cursor = mysql.connection.cursor()

    cursor.execute("INSERT INTO computer_equipments (specs,assign,name) VALUES (%s,%s,%s)",(spec,lab_name,name))
    mysql.connection.commit()

    return "success"


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
    print(lab_name)
    cursor = mysql.connection.cursor()

    cursor.execute("INSERT INTO accessories_equipment (spec,lab,name) VALUES (%s,%s,%s)",(spec,lab_name,name))
    mysql.connection.commit()

    return "success"
    
if __name__ == '__main__':
    app.run(debug=True)
