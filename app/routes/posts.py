import logging
from flask import Blueprint, request, jsonify
from app.models.post import Post

logging.basicConfig(level=logging.ERROR, format='%(asctime)s %(levelname)s: %(message)s')

bp = Blueprint('posts', __name__, url_prefix='/posts')

@bp.route('/create', methods=['POST'])
def create():
    try:
        creation_date = request.json['creation_date']
        state = request.json['state']
        method_payment = request.json['method_payment']
        total_price = request.json['total_price']
        client = request.json['client']

        post = Post(creation_date, state, method_payment, total_price, client)

        post_id = post.save()

        return jsonify({'message': 'Post created successfully!', 'id': str(post_id)}), 201
    except KeyError as e:
        return jsonify({'error': f'The field is missing {e}'}), 400
    except Exception as e:
        logging.error('Error creating post.', exc_info=True)
        return jsonify({'error': 'Error creating post'}), 500

@bp.route('/list', methods=['GET'])
def list():
    try:
        posts = Post.get_all()

        posts_json = [{'creation date': row[0], 'state': row[1], 'method_payment': row[2], 'total_price': row[3], 'client': row[4]} for row in posts]

        return jsonify(posts_json), 200
    except Exception as e:
        logging.error('Error listing posts.', exc_info=True)
        return jsonify({'error': 'Error listing posts.'}), 500
