makefile_dir := $(abspath $(shell pwd))

docker_group := boundedinfinity
docker_image := jenkins-cli-jobdsl
docker_ver   := 1.0.0
docker_tag   := $(docker_group)/$(docker_image):$(docker_ver)

src_dir := /src

.PHONY: list

list:
	@grep '^[^#[:space:]].*:' Makefile | grep -v ':=' | grep -v '^\.' | sed 's/:.*//g' | tr -d ':' | sort

docker-tag:
	@echo $(docker_tag)

docker-build:
	docker build --tag $(docker_tag) .

docker-build-clean:
	docker build --no-cache --force-rm --tag $(docker_tag) .

docker-bash:
	docker run -it --rm $(docker_tag) bash

docker-dev:
	docker run -it --rm -v $(makefile_dir):$(src_dir) $(docker_tag) bash

docker-push:
	docker push $(docker_tag)
