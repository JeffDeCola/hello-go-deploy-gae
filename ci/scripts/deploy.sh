#!/bin/sh
# hello-go-deploy-gae deploy.sh

echo " "

if [ "$1" = "-debug" ]
then
    echo "deploy.sh -debug (START)"
    # set -e causes the shell to exit if any subcommand or pipeline returns a non-zero status. Needed for concourse.
    # set -x enables a mode of the shell where all executed commands are printed to the terminal.
    set -e -x
    echo " "
else
    echo "deploy.sh (START)"
    # set -e causes the shell to exit if any subcommand or pipeline returns a non-zero status.  Needed for concourse.
    set -e
    echo " "
fi

echo "At start, you should be in a /tmp/build/xxxxx directory with one folder:"
echo "   /hello-go-deploy-gae"
echo " "

echo "Write credential.json file to /root from preset $GOOGLE_APPLICATION_CREDENTIALS_FILE"
echo "$GOOGLE_APPLICATION_CREDENTIALS_FILE" | base64 -d > /root/google-credentials.json

echo "Set $GOOGLE_APPLICATION_CREDENTIALS (file location) env variable"
export GOOGLE_APPLICATION_CREDENTIALS="/root/google-credentials.json"

echo " "

echo "pwd is: $PWD"
echo " "

echo "List whats in the current directory"
ls -la
echo " "

echo "cd hello-go-deploy-gae/example-03-gae"
cd hello-go-deploy-gae/example-03-gae
echo " "

echo "DEPLOY APP TO GAE"
echo " "
echo "      gcloud app browse"
echo "      gcloud app logs tail -s example-01-app"
echo "      gcloud app browse -s example-01-app"
echo " "
gcloud app deploy app.yaml
echo " "

echo "deploy.sh (END)"
echo " "
