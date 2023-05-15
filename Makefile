# Makefile for building the EMA Docker container
# Default version for the resulting image definition by default is the git commit short SHA1.
# Deployment builds should set VERSION and the "publish" make rule
# For details, see commentary on each rule definition below.

# Pull in the base version number.  This keeps the version information
# in a separate file to make source control more convenient and descriptive

IMAGE_NAME=darint00/debug-pod
OS_VERSION=ubuntu:20.04
RELEASE_NAME=${IMAGE_NAME}:v2
RELEASE_LATEST=${IMAGE_NAME}:latest

PROGRESS:=--progress=plain
BUILD_ARGS=--build-arg OS_VERSION=$(OS_VERSION)

# Default container system is Docker, but podman also works
CONTAINER?=docker
p=`/home/KEYS/dockerhub.darint00`





default:	build

all:		build  publish

build:
	$(CONTAINER) build  $(BUILD_ARGS) $(PROGRESS) --tag $(RELEASE_NAME) .
	$(CONTAINER) tag $(RELEASE_NAME) $(RELEASE_LATEST)

publish: 
	$(CONTAINER) push $(RELEASE_NAME) 
	$(CONTAINER) push $(RELEASE_LATEST) 

