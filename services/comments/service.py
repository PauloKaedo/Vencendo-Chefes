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

def generateComments(commentResult):
    comment = {
        "_id": commentResult["_id"],
        "name": commentResult["name"],
        "comment": commentResult["comment"]
    }
    return comment

@service.route("/commentById/<int:id>")

def getCommentById(id):
    comment = []

    connection = getConnectionDb()
    cursor = connection.cursor(dictionary = True)
    cursor.execute(
        "select comments.id as _id, comments.name as name, comments.comment as comment from comments join boss on comments.boss = boss.id where boss.id = " + str(id)
    )

    queryResult = cursor.fetchall()

    for result in queryResult:
        comment.append(generateComments(result))

    return jsonify(comment)

if __name__ == "__main__":
    service.run(
        host='0.0.0.0',
        port='5002',
        debug=DEBUG
    )
    