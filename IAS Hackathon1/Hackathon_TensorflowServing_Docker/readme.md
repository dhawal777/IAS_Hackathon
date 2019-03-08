# Steps

## With Docker

## Camera Side

* Commands to be executed on camera side.
`curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo docker pull tensorflow/serving
sudo docker run -p 8500:8500 -p 8501:8501 --mount type=bind,source=/home/tmp/mnist/,target=/models/my_model -e MODEL_NAME=my_model -t tensorflow/serving`
* 8500 is GRPC port and 8501 is Tensorflow serving port and communication takes place on grpc port therefore central server will make request on respective client grpc port

## Central Server Side

* Commands to be executed on central server side.
`python client_api.py --num_tests=100 --server=camera_ip:8501`
`python client_rpc.py --num_tests=100 --server=camera_ip:8500`
* Above command will make request to given ip and will receive accuracy. 
* To check weather server is listening or not use following command
`GET http://127.0.0.1:8500/v1/models/my_model`

## Resources

* [Medium](https://medium.freecodecamp.org/how-to-deploy-tensorflow-models-to-production-using-tf-serving-4b4b78d41700)
* [Tensorflow Doc](https://www.tensorflow.org/tfx/serving/serving_basic)