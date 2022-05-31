from flask import Flask, render_template, request, redirect, url_for, session, flash
from flask_mysqldb import MySQL, MySQLdb
from flask_bcrypt import bcrypt
import pymysql
#import mysql.connector


kalkafeApp = Flask(__name__)
kalkafeApp.config['MYSQL_HOST'] = 'localhost'
kalkafeApp.config['MYSQL_USER'] = 'root'
kalkafeApp.config['MYSQL_PASSWORD'] = 'mysql'
kalkafeApp.config['MYSQL_DB'] = 'kalkafe'
mysql = MySQL(kalkafeApp)   

@kalkafeApp.route('/')
def index():
    return render_template('home.html')


@kalkafeApp.route('/home')
def home():
    return redirect(url_for('home'))

@kalkafeApp.route('/login', methods=['POST', 'GET'])
def login():
    if request.method == 'POST':
        correou = request.form['correou']
        claveu = request.form['claveu'].encode('utf-8')
        claveCifrada = bcrypt.hashpw(claveu, bcrypt.gensalt())
        actUsuario = mysql.connection.cursor()
        actUsuario.execute("UPDATE usuario SET claveu=%s WHERE correou=%s", (claveCifrada, correou))
        mysql.connection.commit()
        selUsuario = mysql.connection.cursor()
        selUsuario.execute("SELECT * FROM usuario WHERE correou=%s", (correou,))
        u = selUsuario.fetchone()
        selUsuario.close()
        if u is not None:
            if bcrypt.hashpw(claveu, u[3].encode('utf-8')) == u[3].encode('utf-8'):
                session['nombreu'] =u[1] 
                return redirect(url_for('admin'))
            else:
                return 'contraseña incorrecta'       
        else: 
            return 'usuario inexistente'      
    return render_template('login.html')

@kalkafeApp.route('/admin')
def admin():
    return render_template('admin.html')

@kalkafeApp.route('/Producto')
def Producto():
    return render_template('Producto.html')

@kalkafeApp.route('/promociones')
def promociones():
    return render_template('promociones.html')

@kalkafeApp.route('/contactanos')
def contactanos():
    return render_template('contactanos.html')

@kalkafeApp.route('/sucursales')
def sucursales():
    return render_template('sucursales.html')

@kalkafeApp.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('index'))
if __name__=='__main__':
    kalkafeApp.secret_key= '1234'
    kalkafeApp.run(port= 3000, debug= True)

#ola

#mydb = mysql.connector.connect(
  #host="localhost",
  #user="yourusername",
  #password="yourpassword",
  #database="mydatabase"
#)

#mycursor = mydb.cursor()
#sql = "INSERT INTO customers (nombreu, claveu) VALUES (val, val2)"
#mycursor.execute(sql, val)

#mydb.commit()

#<input type="text" name="name" id="uniqueID" value="value" />
#<input type="text" name="con" id="uniqueID2" value="value" />

#var val = document.getElementById("uniqueID").value;
#var val2 = document.getElementById("uniqueID2").value;

