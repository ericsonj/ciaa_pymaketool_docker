FROM ubuntu:latest

LABEL maintainer="Ericson Joseph <ericsonjoseph@gmail.com>"

RUN apt-get update ; apt-get upgrade -y

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

RUN apt-get install -y sudo openssl build-essential tree git wget
 
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu -p "$(openssl passwd -1 ubuntu)"

USER ubuntu
WORKDIR /home/ubuntu
ENV PATH=${PATH}:/home/ubuntu/.local/bin

RUN git clone https://github.com/epernia/firmware_v3.git


# RUN sudo apt-get install -y python3 python3-pip python3-gi python3-gi-cairo gir1.2-gtk-3.0 git time zip
# RUN pip3 install pymaketool
# RUN pymaketool -v
# RUN pynewproject CLinuxGCC project_name=hello author="Ericson Joseph"
# RUN cd hello
# RUN make clean
# RUN make