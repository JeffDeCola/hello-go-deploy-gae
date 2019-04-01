#!/bin/sh
# hello-go-deploy-gae deploy-gae.sh

echo "deploy-gae.sh (END)"
echo " "

echo "Sync contents of bucket on google cloud storage with /bucket-gcs"
# gsutil mb -l us-west1 gs://example-02-app/
# gsutil defacl set public-read gs://example-02-app
gsutil -m rsync -r ./bucket-gcs gs://example-02-app/b
echo " "

echo "DEPLOY APP TO GAE"
echo " "
echo "      gcloud app browse"
echo "      gcloud app logs tail -s example-02-app"
echo "      gcloud app browse -s example-02-app"
echo " "
gcloud app deploy app.yaml
echo " "

echo "deploy-gae.sh (END)"
echo " "