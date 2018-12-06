###############################
# Cross compiler
###############################
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "murtis_bazel_compilers",
    url = "https://gitlab.com/murtis/bazel_compilers/-/archive/v0.0.1/bazel_compilers-v0.0.1.tar.gz",
    strip_prefix = 'bazel_compilers-v0.0.1',
    sha256 = "1b254aa94758707032969d00995d2d0fd395fa84cea2eeacdc11903a350b3ad3"
)

load("@murtis_bazel_compilers//compilers:dependencies.bzl", "linaro_5_3_1_arm_linux_gnueabihf_compiler_dependencies")

linaro_5_3_1_arm_linux_gnueabihf_compiler_dependencies()

###############################
# Docker
###############################
git_repository(
    name = "io_bazel_rules_docker",
    remote = "https://github.com/bazelbuild/rules_docker.git",
    tag = "v0.3.0",
)

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
    container_repositories = "repositories",
)

container_repositories()

container_pull(
    name = "rpi_docker_base",
    registry = "index.docker.io",
    repository = "murtis/raspberrypi2_docker_base",
    tag = "latest",
)

container_pull(
    name = "amd64_docker_base",
    registry = "index.docker.io",
    repository = "murtis/amd64_docker_base",
    tag = "latest",
)

###############################
# Python
###############################
http_archive(
    name = "io_bazel_rules_python",
    sha256 = "dfce229d146767bf7ccdd5af34171e526cc0c7ef28845acafc0524307f9bfe96",
    strip_prefix = "rules_python-73a154a181a53ee9e021668918f8a5bfacbf3b43",
    urls = ["https://github.com/bazelbuild/rules_python/archive/73a154a181a53ee9e021668918f8a5bfacbf3b43.tar.gz"],
)

load("@io_bazel_rules_python//python:pip.bzl", "pip_repositories", "pip_import")

pip_repositories()

pip_import(
    name = "pip_requirements",
    requirements = "//:requirements.txt",
)

load("@pip_requirements//:requirements.bzl", "pip_install")

pip_install()
