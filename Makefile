all: build push

build:
	docker build -t ${DOCKER_USER}/influxdb:0.9.1 .

push: build
	docker push ${DOCKER_USER}/influxdb:0.9.1

test: build
	docker run -i ${DOCKER_USER}/influxdb:0.9.1 /bin/bash -l -c '/opt/influxdb/influx -version'
