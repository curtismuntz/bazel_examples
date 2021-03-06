#!/bin/bash
set -e

function stop {
  docker stop travis_build
}
trap stop EXIT

TARGETS="//src/...
         //deploy/...
        "

OPTS="-c opt"

docker run -it --rm -d \
  --name travis_build \
  -v "$PWD":/opt/src \
  murtis/bazelisk_container \
  /bin/bash

docker exec travis_build bazel build $OPTS $TARGETS
docker exec travis_build bazel build --config=armv7hf $OPTS $TARGETS
