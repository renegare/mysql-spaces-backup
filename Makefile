PROJECT?=util
SERVICE?=db-backup
VERSION?=$(shell git rev-parse --short HEAD)
IMAGE?=renegare/$(PROJECT)-$(SERVICE)

build:
	docker build -t $(IMAGE):$(VERSION) .
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest
	docker images $(IMAGE)