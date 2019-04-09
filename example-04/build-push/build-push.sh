#!/bin/sh -e
# hello-go-deploy-gae build-push.sh

echo " "

if [ "$1" = "-debug" ]
then
    echo "************************************************************************"
    echo "* build-push.sh -debug (START) *****************************************"
    echo "************************************************************************"
    # set -x enables a mode of the shell where all executed commands are printed to the terminal.
    set -x
    echo " "
else
    echo "************************************************************************"
    echo "* build-push.sh (START) ************************************************"
    echo "************************************************************************"
    echo " "
fi

echo "Build your docker image from binary /bin/hello-go using /build-push/Dockerfile"
docker build -t jeffdecola/hello-go-deploy-gae .
echo " "

echo "Assuming you are logged in, lets push your built docker image to DockerHub"
docker push jeffdecola/hello-go-deploy-gae
echo " "

echo "To run & shell into the docker container"
echo "    docker run --name hello-go -p 8080:8080 -dit jeffdecola/hello-go-deploy-gae"
echo "    docker exec -i -t hello-go /bin/bash"
echo " "

echo "************************************************************************"
echo "* build-push.sh (END) **************************************************"
echo "************************************************************************"
echo " "
