#!/bin/bash
set -e

apt-get -q update && apt-get upgrade -yq && apt-get install -yq --no-install-recommends \
  software-properties-common \
  build-essential \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*
