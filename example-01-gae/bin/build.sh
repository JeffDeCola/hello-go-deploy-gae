#!/bin/sh
# hello-go-deploy-gae build.sh

echo " "

if [ "$1" = "-debug" ]
then
    echo "build.sh -debug (START)"
    echo " "
    # set -x enables a mode of the shell where all executed commands are printed to the terminal.
    set -x
    echo " "
else
    echo " "
    echo "build.sh (START)"
    echo " "
fi

echo "Create a binary hello-go in /bin"
go build -o hello-go ../main.go
echo ""

echo "build.sh (END)"
echo " "