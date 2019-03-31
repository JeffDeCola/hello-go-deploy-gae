#!/bin/sh
# hello-go-deploy-gae deploy-gae.sh

echo "deploy-gae.sh (END)"
echo " "

echo "DEPLOY APP TO GAE"
echo " "
gcloud app deploy app.yaml
echo " "

echo "deploy-gae.sh (END)"
echo " "