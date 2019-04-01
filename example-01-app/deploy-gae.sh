#!/bin/sh
# hello-go-deploy-gae deploy-gae.sh

echo "deploy-gae.sh (END)"
echo " "

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