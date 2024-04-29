from flask import Flask, render_template, request
import mysql.connector
from datetime import datetime
import random

app = Flask(__name__)

# MySQL database configuration
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'pikujesh1',
    'database': 'cs4347proj'
}

@app.route('/')
def home():
    return render_template('user_registration.html')

@app.route('/register', methods=['POST'])
def register():
    email = request.form['email']
    password = request.form['password']
    name = request.form['name']

    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()

    # Check if the email already exists in the database
    # Secure version (parameterized query)
    query = "SELECT * FROM User WHERE Email = %s"
    cursor.execute(query, (email,))

    # Vulnerable version (string concatenation)
    # query = "SELECT * FROM User WHERE Email = '" + email + "'"
    # cursor.execute(query)

    result = cursor.fetchone()

    if result:
        return "Email already exists. Please choose a different email."
    else:
        # Insert the new user into the database
        # Secure version (parameterized query)
        query = "INSERT INTO User (Email, Password, Name) VALUES (%s, %s, %s)"
        cursor.execute(query, (email, password, name))

        # Vulnerable version (string concatenation)
        # query = "INSERT INTO User (Email, Password, Name) VALUES ('" + email + "', '" + password + "', '" + name + "')"
        # cursor.execute(query)

        conn.commit()
        return "User registered successfully."

@app.route('/login', methods=['POST'])
def login():
    email = request.form['email']
    password = request.form['password']

    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()

    # Check if the email and password match a user in the database
    # Secure version (parameterized query)
    # query = "SELECT * FROM User WHERE Email = %s AND Password = %s"
    # cursor.execute(query, (email, password))

    # Vulnerable version (string concatenation)
    query = "SELECT * FROM User WHERE Email = '" + email + "' AND Password = '" + password + "'"
    cursor.execute(query)

    result = cursor.fetchone()

    if result:
        return "Login successful."
    else:
        return "Invalid email or password."

@app.route('/video_upload')
def video_upload():
    return render_template('video_upload_form.html')

@app.route('/upload_video', methods=['POST'])
def upload_video():
    video_url = request.form['video_url']
    notes = request.form['notes']

    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()

    # Get the current timestamp
    timestamp = datetime.now()

    # Generate a random score between 0 and 100
    score = random.randint(0, 100)
    # Exercise ID 
    eID = random.randint(0,10)
    # Insert the video details into the PerformanceVideos table
    query = "INSERT INTO PerformanceVideos (UserID, ExerciseID, Timestamp, VideoURL, Score) VALUES (%s, %s, %s, %s, %s)"
    values = (1, eID, timestamp, video_url, score)  # Assuming UserID is 1, you can replace it with the actual UserID
    cursor.execute(query, values)
    conn.commit()

    cursor.close()
    conn.close()

    return redirect(url_for('video_upload'))

@app.route('/test_connection')
def test_connection():
    try:
        connection = mysql.connector.connect(**db_config)
        connection.close()
        return 'MySQL connection successful'
    except mysql.connector.Error as error:
        return f'MySQL connection failed: {error}'

if __name__ == '__main__':
    app.run(debug=True)