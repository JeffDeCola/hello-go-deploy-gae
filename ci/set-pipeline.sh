#!/bin/bash
# hello-go-deploy-gae set-pipeline.sh

fly -t ci set-pipeline -p hello-go-deploy-gae -c pipeline.yml --load-vars-from ../../../../../.credentials.yml
