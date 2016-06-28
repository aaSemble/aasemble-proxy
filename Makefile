default: build push

build:
	docker build -f flavors/ubuntu/Dockerfile -t sorenh/aasembleproxy:ubuntu .
	docker build -f flavors/alpine/Dockerfile -t sorenh/aasembleproxy:alpine .

push:
	docker push sorenh/aasembleproxy:ubuntu
	docker push sorenh/aasembleproxy:alpine
