#!/bin/sh
# hello-go-deploy-gae deploy-gae.sh

echo " "

if [ "$1" = "-debug" ]
then
    echo "deploy-gae.sh -debug (START)"
    echo " "
    # set -x enables a mode of the shell where all executed commands are printed to the terminal.
    set -x
    echo " "
else
    echo " "
    echo "deploy-gae.sh (END) (START)"
    echo " "
fi

echo "DEPLOY APP TO GAE"
echo " "
echo "      gcloud app browse"
echo "      gcloud app logs tail -s example-01-app"
echo "      gcloud app browse -s example-01-app"
echo " "
gcloud app deploy app.yaml
echo " "

echo "deploy-gae.sh (END)"
echo " "