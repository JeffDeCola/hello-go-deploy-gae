#!/bin/bash
# hello-go-deploy-gae destroy-pipeline.sh

fly -t ci destroy-pipeline --pipeline hello-go-deploy-gae
