# if command of docker is executable that iis command return the docker command location than x flag test it
#there and able to execute
if [ -x "$(command -v docker)" ]; then
    echo "Update docker"
    # command
else
    echo "Install docker"
    # simple 2 steps to install docker
    $ curl -fsSL https://get.docker.com -o get-docker.sh
	$ sh get-docker.sh
    # command
fi

tar -xvzf hackathon_1.tar.gz

sudo docker stop $(echo $pass | sudo docker ps -aq)
sudo docker pull tensorflow/serving

sudo docker run -p 8500:8500 -p 8501:8501 --mount type=bind,source=/home/dhawal/hackathon_1/tmp/mnist/,target=/models/my_model -e MODEL_NAME=my_model -t tensorflow/serving
