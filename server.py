from flask import Flask
from flask import render_template, request, redirect, url_for, jsonify
import os
from sklearn.preprocessing import LabelEncoder
from sklearn.utils import  shuffle
from sklearn.model_selection import train_test_split
import tensorflow as tf
from tensorflow.examples.tutorials.mnist import input_data
tf.reset_default_graph()


app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/testing',methods=['POST'])
def testing():
	destination = 'Default.csv'
	for f in request.files.getlist('file'):
		if f.filename == '':
			break
		else:
			cwd = os.getcwd()
			target = os.path.join(cwd, 'testing/')
			filename = f.filename
			ext = filename.split('.')
			destination = '/'.join([target, filename])
			f.save(destination)
	# print(destination)
	
	mnist = input_data.read_data_sets("MNIST_data/", one_hot=True) # y labels are oh-encoded

	n_input = 784   # input layer (28x28 pixels)
	n_output = 10   # output layer (0-9 digits)


	n_test = mnist.test.num_examples # 10,000


	n_input = 784   # input layer (28x28 pixels)
	n_hidden1 = 512 # 1st hidden layer
	n_hidden2 = 256 # 2nd hidden layer
	n_hidden3 = 128 # 3rd hidden layer
	n_output = 10   # output layer (0-9 digits)


	X = tf.placeholder("float", [None, n_input])
	Y = tf.placeholder("float", [None, n_output])
	keep_prob = tf.placeholder(tf.float32) 

	weights = {
	    'w1': tf.Variable(tf.truncated_normal([n_input, n_hidden1], stddev=0.1)),
	    'w2': tf.Variable(tf.truncated_normal([n_hidden1, n_hidden2], stddev=0.1)),
	    'w3': tf.Variable(tf.truncated_normal([n_hidden2, n_hidden3], stddev=0.1)),
	    'out': tf.Variable(tf.truncated_normal([n_hidden3, n_output], stddev=0.1)),
	}


	biases = {
	    'b1': tf.Variable(tf.constant(0.1, shape=[n_hidden1])),
	    'b2': tf.Variable(tf.constant(0.1, shape=[n_hidden2])),
	    'b3': tf.Variable(tf.constant(0.1, shape=[n_hidden3])),
	    'out': tf.Variable(tf.constant(0.1, shape=[n_output]))
	}


	layer_1 = tf.add(tf.matmul(X, weights['w1']), biases['b1'])
	layer_2 = tf.add(tf.matmul(layer_1, weights['w2']), biases['b2'])
	layer_3 = tf.add(tf.matmul(layer_2, weights['w3']), biases['b3'])
	layer_drop = tf.nn.dropout(layer_3, keep_prob)
	output_layer = tf.matmul(layer_3, weights['out']) + biases['out']


	saver = tf.train.Saver()

	mnist.test.images

	with tf.Session() as sess:
	  
	    saver.restore(sess, "model.ckpt")
	    print("Model restored.")
	    correct_pred = tf.equal(tf.argmax(output_layer, 1), tf.argmax(Y, 1))
	    accuracy = tf.reduce_mean(tf.cast(correct_pred, tf.float32))
	    test_accuracy = sess.run(accuracy, feed_dict={X: mnist.test.images, Y: mnist.test.labels, keep_prob:1.0})
	    print("\nAccuracy on test set:", test_accuracy)
	    return str(test_accuracy)


if __name__ == '__main__':
    app.run(port=5000, debug=True, threaded=True, host='0.0.0.0')

#10.42.0.238
