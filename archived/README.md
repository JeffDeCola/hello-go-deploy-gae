# HELLO GO DEPLOY GAE

[![Tag Latest](https://img.shields.io/github/v/tag/jeffdecola/hello-go-deploy-gae)](https://github.com/JeffDeCola/hello-go-deploy-gae/tags)
[![Go Reference](https://pkg.go.dev/badge/github.com/JeffDeCola/hello-go-deploy-gae.svg)](https://pkg.go.dev/github.com/JeffDeCola/hello-go-deploy-gae)
[![Go Report Card](https://goreportcard.com/badge/github.com/JeffDeCola/hello-go-deploy-gae)](https://goreportcard.com/report/github.com/JeffDeCola/hello-go-deploy-gae)
[![codeclimate Maintainability](https://api.codeclimate.com/v1/badges/dc7f5a341aed6ae341d0/maintainability)](https://codeclimate.com/github/JeffDeCola/hello-go-deploy-gae/maintainability)
[![codeclimate Issue Count](https://codeclimate.com/github/JeffDeCola/hello-go-deploy-gae/badges/issue_count.svg)](https://codeclimate.com/github/JeffDeCola/hello-go-deploy-gae/issues)
[![Docker Pulls](https://badgen.net/docker/pulls/jeffdecola/hello-go-deploy-gae?icon=docker&label=pulls)](https://hub.docker.com/r/jeffdecola/hello-go-deploy-gae/)
[![MIT License](http://img.shields.io/:license-mit-blue.svg)](http://jeffdecola.mit-license.org)
[![jeffdecola.com](https://img.shields.io/badge/website-jeffdecola.com-blue)](https://jeffdecola.com)

_Deploy a "hello-world" docker image to
Google App Engine (gae)._

Other Services

* PaaS
  * [hello-go-deploy-aws-elastic-beanstalk](https://github.com/JeffDeCola/hello-go-deploy-aws-elastic-beanstalk)
  * [hello-go-deploy-azure-app-service](https://github.com/JeffDeCola/hello-go-deploy-azure-app-service)
  * [hello-go-deploy-gae](https://github.com/JeffDeCola/hello-go-deploy-gae)
    **(You are here)**
  * [hello-go-deploy-marathon](https://github.com/JeffDeCola/hello-go-deploy-marathon)
* CaaS
  * [hello-go-deploy-amazon-ecs](https://github.com/JeffDeCola/hello-go-deploy-amazon-ecs)
  * [hello-go-deploy-amazon-eks](https://github.com/JeffDeCola/hello-go-deploy-amazon-eks)
  * [hello-go-deploy-aks](https://github.com/JeffDeCola/hello-go-deploy-aks)
  * [hello-go-deploy-gke](https://github.com/JeffDeCola/hello-go-deploy-gke)
* IaaS
  * [hello-go-deploy-amazon-ec2](https://github.com/JeffDeCola/hello-go-deploy-amazon-ec2)
  * [hello-go-deploy-azure-vm](https://github.com/JeffDeCola/hello-go-deploy-azure-vm)
  * [hello-go-deploy-gce](https://github.com/JeffDeCola/hello-go-deploy-gce)

Table of Contents

* ???

Documentation and Reference

* The
  [hello-go-deploy-gae docker image](https://hub.docker.com/r/jeffdecola/hello-go-deploy-gae)
  on DockerHub
* This repos
  [github webpage](https://jeffdecola.github.io/hello-go-deploy-gae/)
  _built with
  [concourse](https://github.com/JeffDeCola/hello-go-deploy-gae/blob/master/ci-README.md)_

## PREREQUISITES

For this exercise I used go.  Feel free to use a language of your choice,

* [go](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/software/development/languages/go-cheat-sheet)

To build a docker image you will need docker on your machine,

* [docker](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/software/operations-tools/orchestration/builds-deployment-containers/docker-cheat-sheet)

To push a docker image you will need,

* [DockerHub account](https://hub.docker.com/)

To deploy to `gae` you will need,

* [google app engine (gae)](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/software/service-architectures/platform-as-a-service/google-app-engine-cheat-sheet)

As a bonus, you can use Concourse CI to run the scripts,

* [concourse](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/software/operations-tools/continuous-integration-continuous-deployment/concourse-cheat-sheet)
  (Optional)

## EXAMPLES

There are a few examples in this repo.  We will deploy example example 3.

### EXAMPLE 1

[example-01](https://github.com/JeffDeCola/hello-go-deploy-gae/tree/master/example-01)
is a simple hello world website.

You can deploy it locally,

```bash
sh deploy-local-app-server.sh
```

And see the webpage,

[http://localhost:8080](http://localhost:8080)

You can also deploy it to gae,

```bash
sh deploy-gae.sh
```

### EXAMPLE 2

[example-02](https://github.com/JeffDeCola/hello-go-deploy-gae/tree/master/example-02)
uses static pages using gcloud.

Like example-01 you can deploy it locally,

```bash
sh deploy-local-app-server.sh
```

And see the webpage,

[http://localhost:8080](http://localhost:8080)

You can also deploy it to gae,

```bash
sh deploy-gae.sh
```

### EXAMPLE 3

 [example-03](https://github.com/JeffDeCola/hello-go-deploy-gae/tree/master/example-03)
 will show the latest number from a counter.

The output will look like,

```bash
Hello, world! - Example 03
The current count is 39
```

This example is used in my concourse scripts (optional).

### EXAMPLE 4 (DEPLOY A DOCKER IMAGE TO GAE)

[example-04](https://github.com/JeffDeCola/hello-go-deploy-gae/tree/master/example-04)
deploys a docker image to `gae`.

NOTE: I don't know how to run a local docker container and
use the local app server.  And honestly, not
that interested in doing this.

Your `app.yaml` file will now be telling `gae` you are using
a docker container.

```yaml
runtime: custom
env: flex
```

`gae` will build the docker image when you deploy.  I'm not a huge fan of this.
Hence, the Dockerfile must be in the directory you deploy in.

If you want to use the local app server remember to
use `appengine.Main()` in main.go.

## STEP 1 - TEST (EXAMPLE 3)

Lets unit test the code,

```bash
go test -cover ./... | tee /test/test_coverage.txt
```

This script runs the above command
[unit-tests.sh](https://github.com/JeffDeCola/hello-go-deploy-gae/tree/master/example-03/test/unit-tests.sh).

This script runs the above command in concourse
[/ci/scripts/unit-test.sh](https://github.com/JeffDeCola/hello-go-deploy-gae/tree/master/ci/scripts/unit-tests.sh).

## STEP 2 - DEPLOY (TO GAE) (EXAMPLE 3)

Refer to my
[gae cheat sheet](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/software/service-architectures/platform-as-a-service/google-app-engine-cheat-sheet)
for more detailed information and a nice illustration.

This script is
[deploy-gae.sh](https://github.com/JeffDeCola/hello-go-deploy-gae/tree/master/example-03/deploy-gae.sh).

Lastly, this script runs all of the above commands in concourse
[/ci/scripts/deploy.sh](https://github.com/JeffDeCola/hello-go-deploy-gae/tree/master/ci/scripts/deploy.sh).

## CHECK THAT hello-go is RUNNING IN APP ENGINE

Goto the console in `gae` or,

```bash
gcloud app logs tail -s example-03
gcloud app browse
```

## A HIGH LEVEL VIEW OF GAE

Here is an illustration how everything fits together.

![IMAGE -  google compute engine creating deploying custom image - IMAGE](https://github.com/JeffDeCola/my-cheat-sheets/blob/master/docs/pics/gae-app-service-view.jpg)

## TEST, BUILT, PUSH & DEPLOY USING CONCOURSE (OPTIONAL)

For fun, I use concourse to automate the above steps.

A pipeline file [pipeline.yml](https://github.com/JeffDeCola/hello-go-deploy-gae/tree/master/ci/pipeline.yml)
shows the entire ci flow. Visually, it looks like,

![IMAGE - hello-go-deploy-gae concourse ci pipeline - IMAGE](docs/pics/hello-go-deploy-gae-pipeline.jpg)

The `jobs` and `tasks` are,

* `job-readme-github-pages` runs task
  [readme-github-pages.sh](https://github.com/JeffDeCola/hello-go-deploy-gae/tree/master/ci/scripts/readme-github-pages.sh).
* `job-unit-tests` runs task
  [unit-tests.sh](https://github.com/JeffDeCola/hello-go-deploy-gae/tree/master/ci/scripts/unit-tests.sh).
* `job-build-push` runs task
  [build-push.sh](https://github.com/JeffDeCola/hello-go-deploy-gae/tree/master/ci/scripts/build-push.sh).
* `job-deploy` runs task
  [deploy.sh](https://github.com/JeffDeCola/hello-go-deploy-gae/tree/master/ci/scripts/deploy.sh).

The concourse `resources type` are,

* `hello-go-deploy-gae` uses a resource type
  [docker-image](https://hub.docker.com/r/concourse/git-resource/)
  to PULL a repo from github.
* `resource-dump-to-dockerhub` uses a resource type
  [docker-image](https://hub.docker.com/r/concourse/docker-image-resource/)
  to PUSH a docker image to dockerhub.
* `resource-marathon` users a resource type
  [docker-image](https://hub.docker.com/r/ckaznocha/marathon-resource)
  to DEPLOY the newly created docker image to marathon.
* `resource-slack-alert` uses a resource type
  [docker image](https://hub.docker.com/r/cfcommunity/slack-notification-resource)
  that will notify slack on your progress.
* `resource-repo-status` uses a resource type
  [docker image](https://hub.docker.com/r/dpb587/github-status-resource)
  that will update your git status for that particular commit.

For more information on using concourse for continuous integration,
refer to my cheat sheet on [concourse](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/software/operations-tools/continuous-integration-continuous-deployment/concourse-cheat-sheet).
