FROM cuda10-cudnn7-opencv3.4.0:latest

WORKDIR /var/darknet

# setup nvidia docker
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

# build darknet
RUN git clone https://github.com/AlexeyAB/darknet.git .
# specify latest commit because AlexeyAB/darknet does not maintained with github's release
RUN git checkout d9e559a245829830dec03c6d3b909857c6d7937f
# configure build settings
RUN sed -ie "s/GPU=0/GPU=1/g" Makefile
RUN sed -ie "s/CUDNN=0/CUDNN=1/g" Makefile
RUN sed -ie "s/OPENCV=0/OPENCV=1/g" Makefile
RUN sed -ie "s/LIBSO=0/LIBSO=1/g" Makefile
RUN make

RUN ln -s /var/darknet/darknet /usr/local/bin

