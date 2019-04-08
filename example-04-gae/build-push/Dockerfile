# hello-go-deploy-gce Dockerfile used to build docker image

FROM golang

LABEL Jeff DeCola (https://github.com/JeffDeCola/hello-go-deploy-gae)

RUN cd ..

COPY . /app

RUN ls -ls

WORKDIR app/

EXPOSE 8080

CMD go run main.go
