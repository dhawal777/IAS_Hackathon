tar -xvzf hackathon_1.tar.gz

sudo apt-get update
sudo apt-get install python3.6
sudo apt-get python3-pip -y
pip3 install pandas --user
pip3 install tensorflow --user
pip3 install sklearn --user
echo "deb [arch=amd64] http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" | sudo tee /etc/apt/sources.list.d/tensorflow-serving.list && \
curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install tensorflow-model-server
sudo apt-get upgrade tensorflow-model-server
pip3 install tensorflow-serving-api --user

tensorflow_model_server --rest_api_port=8501 --port=8500 --model_name=my_model --model_base_path=/home/vatsal/Documents/IIIT/Sem-2/IAS/Hackathon_TensorflowServing/hackathon_1/tmp/mnist/
