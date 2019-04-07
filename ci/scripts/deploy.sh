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

echo "PRESTEPS"
echo " "

echo "Note: $GOOGLE_JEFFS_PROJECT_ID AND $GOOGLE_SERVICE_ACCOUNT_EMAIL_ADDRESS env variable already preset"
echo " "

echo "Write credential.json file to /root from preset $GOOGLE_APPLICATION_CREDENTIALS_FILE"
echo "$GOOGLE_APPLICATION_CREDENTIALS_FILE" | base64 -d > /root/google-credentials.json

echo "Set $GOOGLE_APPLICATION_CREDENTIALS (file location) env variable"
export GOOGLE_APPLICATION_CREDENTIALS="/root/google-credentials.json"
echo " "

echo "gcloud auth"
echo gcloud auth activate-service-account "$GOOGLE_SERVICE_ACCOUNT_EMAIL_ADDRESS" --key-file "$GOOGLE_APPLICATION_CREDENTIALS"
gcloud auth activate-service-account "$GOOGLE_SERVICE_ACCOUNT_EMAIL_ADDRESS" --key-file "$GOOGLE_APPLICATION_CREDENTIALS"
echo " "

echo "gcloud config set project $GOOGLE_JEFFS_PROJECT_ID"
gcloud config set project "$GOOGLE_JEFFS_PROJECT_ID"
echo " "

echo "gcloud version"
gcloud version
echo " "

echo "gcloud components list"
gcloud components list
echo " "

echo "gcloud projects describe $GOOGLE_JEFFS_PROJECT_ID"
gcloud projects describe "$GOOGLE_JEFFS_PROJECT_ID"
echo " "

echo "cd hello-go-deploy-gae/example-03-gae"
cd hello-go-deploy-gae/example-03-gae
echo " "

echo "pwd is: $PWD"
echo " "

echo "List whats in the current directory"
ls -la
echo " "

echo "DEPLOY APP TO GAE"
echo " "
echo "      gcloud app browse"
echo "      gcloud app logs tail -s example-03-app"
echo "      gcloud app browse -s example-03-app"
echo " "
gcloud -q app deploy app.yaml
echo " "

echo "deploy.sh (END)"
echo " "
