from flask import Flask, jsonify
import mysql.connector as mysql

service = Flask (__name__)

IS_ALIVE = "yes"
DEBUG = True
PAGE_LIMIT = 4

MYSQL_SERVER = "database"
MYSQL_USER = "root"
MYSQL_PASS = "admin"
MYSQL_BANCO = "vencendochefes"

def getConnectionDb():
    conenection = mysql.connect(
        host=MYSQL_SERVER, user=MYSQL_USER, password=MYSQL_PASS, database=MYSQL_BANCO
    )
    
    return conenection

def generateDetonated(detonated):
    detonated = {
        "_id": detonated["_id"],
        "detonated": detonated["detonated"],        
    }
    return detonated

@service.route("/detonatedByEnemyId/<int:id>")

def getDetonatedByEnemyId(id):
    detonated = []

    connection = getConnectionDb()
    cursor = connection.cursor(dictionary = True)
    cursor.execute(
        "select detonated.id as _id, detonated.detonated as detonated from detonated join enemies on detonated.enemy = enemies.id where enemies.id = " + str(id) + " limit 1"
    )

    queryResult = cursor.fetchall()

    for result in queryResult:
        detonated.append(generateDetonated(result))

    return jsonify(detonated)

if __name__ == "__main__":
    service.run(
        host='0.0.0.0',
        port='5003',
        debug=DEBUG
    )
    