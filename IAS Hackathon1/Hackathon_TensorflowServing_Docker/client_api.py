from __future__ import print_function
import sys
import threading
import grpc
import numpy
import tensorflow as tf
# from tensorflow_serving.apis import predict_pb2
import mnist_input_data,os,requests,json
from sklearn.metrics import accuracy_score


tf.app.flags.DEFINE_integer('concurrency', 1,
                            'maximum number of concurrent inference requests')
tf.app.flags.DEFINE_integer('num_tests', 100, 'Number of test images')
tf.app.flags.DEFINE_string('server', '', 'PredictionService host:port')
tf.app.flags.DEFINE_string('work_dir', '/tmp', 'Working directory. ')
FLAGS = tf.app.flags.FLAGS

def do_inference(hostport, work_dir, concurrency, num_tests):
  test_data_set = mnist_input_data.read_data_sets(work_dir).test
  fs = []
  fl = []
  for _ in range(num_tests):
    image, label = test_data_set.next_batch(1)
    r=image[0].tolist()
    data={"signature_name":"predict_images","instances":[{"images":r}]}
    data1 = json.dumps(data)
    url="http://localhost:8501/v1/models/my_model:predict"
    response=requests.post(url,data=data1)
    abcd = response.json()
    fs.append(numpy.argmax(abcd['predictions'][0]))
    fl.append(label)
  print(fs)
  return accuracy_score(fs,fl)

def main(_):
  if FLAGS.num_tests > 10000:
    print('num_tests should not be greater than 10k')
    return
  if not FLAGS.server:
    print('please specify server host:port')
    return
  acc = do_inference(FLAGS.server, FLAGS.work_dir,
                            FLAGS.concurrency, FLAGS.num_tests)
  print('\nAccuracy: %s%%' % (acc * 100))


if __name__ == '__main__':
  tf.app.run()

