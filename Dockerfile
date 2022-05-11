FROM ubuntu:20.04


LABEL maintainer="team@hacktivesecurity.com"
LABEL version="1.0"
LABEL description="Qiling Tutorial Dlink"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN apt update
RUN apt install wget unzip build-essential liblzma-dev liblzo2-dev zlib1g-dev 
binwalk mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract  cramfsswap 
squashfs-tools sleuthkit default-jdk lzop srecord python3-dev automake flex bison 
libglib2.0-dev libpixman-1-dev clang python3-setuptools llvm python3-pip git cmake 
build-essential libtool-bin

RUN pip3 install qiling

RUN git clone https://github.com/AFLplusplus/AFLplusplus
RUN cd AFLplusplus; make
RUN cd AFLplusplus/unicorn_mode; ./build_unicorn_support.sh

COPY DIR645A1_FW103B11.zip .
RUN unzip DIR645A1_FW103B11.zip

RUN git clone https://github.com/devttys0/sasquatch
RUN cd sasquatch; ./build.sh

RUN git clone https://github.com/qilingframework/qiling

WORKDIR  /qiling/examples/fuzzing/dlink_dir815
RUN binwalk -Me /DIR645A1_FW103B11.bin

CMD tail -F anything

