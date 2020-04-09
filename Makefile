build-deps:
	cd cuda10-cudnn7-opencv3.4.0 && docker build -t cuda10-cudnn7-opencv3.4.0:latest .
build: build-deps
	docker build -t darknet-docker:latest .
