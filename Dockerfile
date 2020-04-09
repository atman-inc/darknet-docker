FROM cuda10-cudnn7-opencv3.4.0:latest

WORKDIR /var/darknet

# setup nvidia docker
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

COPY darknet /var/darknet
# configure build settings
RUN sed -ie "s/GPU=0/GPU=1/g" Makefile
RUN sed -ie "s/CUDNN=0/CUDNN=1/g" Makefile
RUN sed -ie "s/OPENCV=0/OPENCV=1/g" Makefile
RUN sed -ie "s/LIBSO=0/LIBSO=1/g" Makefile
RUN make

RUN ln -s /var/darknet/darknet /usr/local/bin

