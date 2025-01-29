from datetime import datetime
from flask import current_app, g
from app.utils.db import get_db

class Post:
    def __init__(self, creation_date, state, method_payment, total_price, client):
        self.creation_date = datetime.utcnow()
        self.state = state
        self.method_payment = method_payment
        self.total_price = total_price
        self.client = client
        

    def save(self):
        db = get_db()
        cursor = db.cursor()
        cursor.execute(
            "INSERT INTO dish (creation_date, state, method_payment, total_price, client) VALUES (%s, %s, %s, %s, %s) RETURNING id",
            (self.creation_date, self.state, self.method_payment, self.total_price, self.client)
        )
        post_id = cursor.fetchone()[0]
        db.commit()
        cursor.close()
        return post_id

    @staticmethod
    def get_all():
        db = get_db()
        cursor = db.cursor()
        cursor.execute("SELECT o.creation_date, s.name, o.method_payment, o.total_price, o.client FROM orders AS o JOIN state_order as s ON o.state = s.id")
        posts = cursor.fetchall()
        print(posts)
        cursor.close()
        return posts
        #return [{'creation_date': row[1], 'state': row[2], 'method_payment': row[3], 'total_price': [4], 'client': row[5]} for row in posts]

