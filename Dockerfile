FROM cuda10.0-cudnn7-opencv3.4.0:latest

WORKDIR /var/darknet

# setup nvidia docker
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

# darknet
RUN git clone https://github.com/AlexeyAB/darknet.git .
# specify latest commit because AlexeyAB/darknet does not maintained with github's release
RUN git checkout d9e559a245829830dec03c6d3b909857c6d7937f
RUN make

