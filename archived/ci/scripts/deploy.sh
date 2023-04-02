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

echo "------------------------------------------------------------"
echo "PRESTEPS - AUTHENTICATE GCP ACCOUNT VIA SERVICE ACCOUNT FILE"
echo "------------------------------------------------------------"
echo " "

echo "Note: $GCP_JEFFS_PROJECT_ID AND $GCP_JEFFS_APP_SERVICE_ACCOUNT_EMAIL_ADDRESS env variable already preset"
echo " "

echo "Write credential.json file to /root from preset $GCP_JEFFS_APP_SERVICE_ACCOUNT_FILE"
echo "$GCP_JEFFS_APP_SERVICE_ACCOUNT_FILE" | base64 -d > /root/google-credentials.json

echo "Set $GCP_JEFFS_APP_SERVICE_ACCOUNT_PATH (file location) env variable"
export GCP_JEFFS_APP_SERVICE_ACCOUNT_PATH="/root/google-credentials.json"
echo " "

echo "gcloud auth activate-service-account $GCP_JEFFS_APP_SERVICE_ACCOUNT_EMAIL_ADDRESS --key-file $GCP_JEFFS_APP_SERVICE_ACCOUNT_PATH"
gcloud auth activate-service-account "$GCP_JEFFS_APP_SERVICE_ACCOUNT_EMAIL_ADDRESS" --key-file "$GCP_JEFFS_APP_SERVICE_ACCOUNT_PATH"
echo " "

echo "gcloud config set project $GCP_JEFFS_PROJECT_ID"
gcloud config set project "$GCP_JEFFS_PROJECT_ID"
echo " "

echo "gcloud version"
gcloud version
echo " "

echo "gcloud components list"
gcloud components list
echo " "

echo "gcloud config list"
gcloud config list
echo " "

echo "--------------------------------------------------------------"
echo "COMPLETED - AUTHENTICATED GCP ACCOUNT VIA SERVICE ACCOUNT FILE"
echo "--------------------------------------------------------------"
echo " "

echo "mkdir -p $GOPATH/src/github.com/JeffDeCola/"
mkdir -p "$GOPATH/src/github.com/JeffDeCola/"
echo " "

echo "cp -R ./hello-go-deploy-gae $GOPATH/src/github.com/JeffDeCola/."
cp -R "./hello-go-deploy-gae" "$GOPATH/src/github.com/JeffDeCola/."
echo " "

echo "cd $GOPATH/src/github.com/JeffDeCola/hello-go-deploy-gae/example-03"
cd "$GOPATH/src/github.com/JeffDeCola/hello-go-deploy-gae/example-03"
echo " "

echo "Check that you are set and everything is in the right place for go:"
echo "gopath is: $GOPATH"
echo "pwd is: $PWD"
ls -la
echo " "

echo "DEPLOY APP TO GAE"
echo "gcloud -q app deploy app.yaml --stop-previous-version"
echo " "
echo "      gcloud app browse"
echo "      gcloud app logs tail -s example-03"
echo "      gcloud app browse -s example-03"
echo " "
gcloud -q app deploy app.yaml --stop-previous-version
echo " "

echo "deploy.sh (END)"
echo " "
