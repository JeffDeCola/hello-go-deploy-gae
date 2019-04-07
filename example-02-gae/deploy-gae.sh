#!/bin/sh -e 
# hello-go-deploy-gae deploy-gae.sh

echo " "

if [ "$1" = "-debug" ]
then
    echo "************************************************************************"
    echo "* deploy-gae.sh -debug (START) *****************************************"
    echo "************************************************************************"
    # set -x enables a mode of the shell where all executed commands are printed to the terminal.
    set -x
    echo " "
else
    echo "************************************************************************"
    echo "* deploy-gae.sh (START) ************************************************"
    echo "************************************************************************"
    echo " "
fi

echo "gcloud config list"
gcloud config list
echo " "

echo "DEPLOY APP TO GAE"
echo " "
echo "      gcloud app browse"
echo "      gcloud app logs tail -s example-02-app"
echo "      gcloud app browse -s example-02-app"
echo '      Webpage: https://'"$GCP_JEFFS_PROJECT_ID"'.appspot.com'
echo " "
gcloud app deploy app.yaml
echo " "

echo "************************************************************************"
echo "* deploy-gae.sh (END) **************************************************"
echo "************************************************************************"
echo " "
