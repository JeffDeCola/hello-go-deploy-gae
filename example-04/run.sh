#!/bin/sh -e
# hello-go-deploy-amazon-ecs run.sh

echo " "

if [ "$1" = "-debug" ]
then
    echo "************************************************************************"
    echo "* run.sh -debug (START) ************************************************"
    echo "************************************************************************"
    # set -x enables a mode of the shell where all executed commands are printed to the terminal.
    set -x
    echo " "
else
    echo "************************************************************************"
    echo "* run.sh (START) *******************************************************"
    echo "************************************************************************"
    echo " "
fi

echo "go run main.go&"
echo " "
go run main.go &
echo " "

echo "naub.go is running in the background"
echo " "
echo "      curl localhost:8080"
echo "      Goto your local webpage: http://localhost:8080/"
echo " "

echo "************************************************************************"
echo "* run.sh (END) **************************************************"
echo "************************************************************************"
echo " "
