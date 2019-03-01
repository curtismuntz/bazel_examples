# Bazel base image
FROM ubuntu:16.04
LABEL maintainer="me@murt.is"

# update ubuntu
RUN apt-get update && apt-get upgrade -y --no-install-recommends

# install compiler stuff
RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  python \
  python3 && \
  rm -rf /var/lib/apt/lists/*

# Allows for the use of any bazel version based off a .bazelversion file
RUN mkdir -p /opt/bazelisk
RUN git clone https://github.com/philwo/bazelisk.git /opt/bazelisk/
RUN cp /opt/bazelisk/bazelisk.py /usr/bin/bazel

RUN mkdir -p /opt/src
ENV WORKSPACE /opt/src
WORKDIR /opt/src
