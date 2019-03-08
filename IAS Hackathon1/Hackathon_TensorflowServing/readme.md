# Steps

## Without Docker

## Camera Side

* Commands to be executed on camera side.
`bash script.sh`
* 8500 is GRPC port and 8501 is Tensorflow serving port and communication takes place on grpc port therefore central server will make request on respective client grpc port

## Central Server Side

* Commands to be executed on central server side.
* To save tensorflow model
`python mnist_saved_model.py ./hackathon_1/tmp/mnist`
* To make request
`python client_api.py --num_tests=100 --server=camera_ip:8501`
`python client_rpc.py --num_tests=100 --server=camera_ip:8500`
* Above command will make request to given ip and will receive accuracy. 
* To check weather server is listening or not use following command
`GET http://127.0.0.1:8500/v1/models/my_model`

## Resources

* [Medium](https://medium.freecodecamp.org/how-to-deploy-tensorflow-models-to-production-using-tf-serving-4b4b78d41700)
* [Tensorflow Doc](https://www.tensorflow.org/tfx/serving/serving_basic)