#!/bin/bash
set -e

function stop {
  docker stop travis_build
}
trap stop EXIT

TARGETS="//src/...
         //deploy/...
        "
CONFIG="--bazelrc=tools/ci/bazelrc_travis"

OPTS="-c opt"

docker run -it --rm -d \
  --name travis_build \
  -v "$PWD":/opt/src \
  murtis/bazel \
  /bin/bash

docker exec travis_build bazel $CONFIG build $OPTS $TARGETS
docker exec travis_build bazel $CONFIG build $OPTS $TARGETS --crosstool_top=//compilers/arm_compiler:toolchain --cpu=rpi
