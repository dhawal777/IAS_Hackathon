echo "Enter password"
read pass
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

echo $pass | sudo -S docker load < hackathon_1.tar
echo $pass | sudo -S docker run --net=host hackathon_1

# docker load < hackathon_1.tar
# docker run --net=host hackathon_1