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

def generateBoss(boss):
    boss = {
        "_id": boss["id"],
        "game": {
            "name": boss["game"]
        },
        "hard": boss["hard"],
        "easy": boss["easy"],
        "enemy": {
            "name": boss["enemy_name"],
            "description": boss["description"],
            "difficulty": boss["difficulty"],
            "avatar": boss["avatar"]
        }
    }
    return boss

def generateBossId(boss):
    boss = {
        "_id": boss["id"],
        "hard": boss["hard"],
        "easy": boss["easy"],
        "enemy": {
            "name": boss["enemy_name"],
            "description": boss["description"],
            "difficulty": boss["difficulty"],
            "image_1": boss["image_1"],
            "image_2": boss["image_2"],
            "image_3": boss["image_3"],
        }
    }
    return boss



@service.route("/bossById/<int:id>")

def getBossById(id):
    boss = []

    connection = getConnectionDb()
    cursor = connection.cursor(dictionary = True)
    cursor.execute(
        "select boss.id as id, enemies.name as enemy_name, enemies.difficulty as difficulty, enemies.description as description, likes.easy as easy, likes.hard as hard, enemies.image1 as image_1,enemies.image2 as image_2, enemies.image3 as image_3 "+ 
        "from boss join enemies ON enemies.id = boss.enemy join likes ON likes.boss = boss.id where boss.id = " + str(id)
    )

    queryResult = cursor.fetchall()
    
    for result in queryResult:
        boss.append(generateBossId(result))

    return jsonify(boss)
    
@service.route("/bossByName/<string:name>/<int:page>")

def getBossByName(name, page):
    boss = []

    connection = getConnectionDb()
    cursor = connection.cursor(dictionary = True)
    cursor.execute(
        "select boss.id as id, enemies.name as enemy_name, boss.game as game, enemies.difficulty as difficulty , enemies.description as description, likes.easy as easy, likes.hard as hard, enemies.image1 as avatar "+ 
        "from boss join enemies ON enemies.id = boss.enemy join likes ON likes.boss = boss.id where enemies.name Like '%" + str(name) + "%'"+ 
        " limit "+ str((page - 1) * PAGE_LIMIT) + ", " + str(PAGE_LIMIT)
    )

    queryResult = cursor.fetchall()
    for result in queryResult:
        boss.append(generateBoss(result))

    return jsonify(boss)
    
@service.route("/boss/<int:page>")

def getBoss(page):
    boss = []

    connection = getConnectionDb()
    cursor = connection.cursor(dictionary = True)
    cursor.execute(
        "select boss.id as id, enemies.name as enemy_name, boss.game as game, enemies.difficulty as difficulty , enemies.description as description, likes.easy as easy, likes.hard as hard, enemies.image1 as avatar "+ 
        "from boss join enemies ON enemies.id = boss.enemy join likes ON likes.boss = boss.id"+
        " limit "+ str((page - 1) * PAGE_LIMIT) + ", " + str(PAGE_LIMIT)
    )

    queryResult = cursor.fetchall()
    for result in queryResult:
        boss.append(generateBoss(result))

    return jsonify(boss)

if __name__ == "__main__":
    service.run(
        host='0.0.0.0',
        port='5001',
        debug=DEBUG
    )