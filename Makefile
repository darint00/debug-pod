.ONESHELL:
# Makefile for building the EMA Docker container
# Default version for the resulting image definition by default is the git commit short SHA1.
# Deployment builds should set VERSION and the "publish" make rule
# For details, see commentary on each rule definition below.

# Pull in the base version number.  This keeps the version information
# in a separate file to make source control more convenient and descriptive


IMAGE_NAME=darint00/debug-pod
OS_VERSION=ubuntu:20.04
RELEASE_NAME=${IMAGE_NAME}:v3
RELEASE_LATEST=${IMAGE_NAME}:latest

PROGRESS:=--progress=plain
BUILD_ARGS=--build-arg OS_VERSION=$(OS_VERSION)

# Default container system is Docker, but podman also works
CONTAINER?=docker
p=`/home/KEYS/dockerhub.darint00`





default:	build

all:		webapps build  publish

clean:
	rm webapp1/webapp1
	rm webapp2/webapp2

webapps:   webapp-1 webapp-2


webapp-1:
	cd webapp1
	go build -o webapp1 main.go

webapp-2:
	cd webapp2
	go build -o webapp2 main.go


build:
	$(CONTAINER) build  $(BUILD_ARGS) $(PROGRESS) --tag $(RELEASE_NAME) .
	$(CONTAINER) tag $(RELEASE_NAME) $(RELEASE_LATEST)

publish: 
	$(CONTAINER) push $(RELEASE_NAME) 
	$(CONTAINER) push $(RELEASE_LATEST) 

