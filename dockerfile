FROM ubuntu:latest

LABEL maintainer="Ericson Joseph <ericsonjoseph@gmail.com>"

RUN apt-get update ; apt-get upgrade -y

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

RUN apt-get install -y sudo openssl gcc make tree git wget language-pack-en-base time openocd
 
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu -p "$(openssl passwd -1 ubuntu)"

USER ubuntu
WORKDIR /home/ubuntu
ENV PATH=${PATH}:/home/ubuntu/.local/bin

RUN git clone https://github.com/epernia/firmware_v3.git

RUN wget -q https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2

RUN tar -xvf gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2

RUN rm gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2

RUN sudo apt-get install -y python3 python3-pip python3-gi python3-gi-cairo gir1.2-gtk-3.0 git time

RUN pip3 install pymaketool

# RUN pymaketool -v
# RUN pynewproject CLinuxGCC project_name=hello author="Ericson Joseph"
# RUN cd hello
# RUN make clean
# RUN make