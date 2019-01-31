###############################
# Cross compiler
###############################
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "murtis_bazel_compilers",
    url = "https://gitlab.com/murtis/bazel_compilers/-/archive/v0.1.0/bazel_compilers-v0.1.0.tar.gz",
    strip_prefix = 'bazel_compilers-v0.1.0',
    sha256 = "8802d0187bcee2f4f20ca885608fa99fe759962db02845f53eaaa929dc8e3c15"
)

load("@murtis_bazel_compilers//compilers:dependencies.bzl", "cross_compiler_dependencies")

cross_compiler_dependencies()

###############################
# Docker
###############################
http_archive(
    name = "io_bazel_rules_docker",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/v0.5.1.tar.gz"],
    sha256 = "29d109605e0d6f9c892584f07275b8c9260803bf0c6fcb7de2623b2bedc910bd",
    strip_prefix = "rules_docker-0.5.1",
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
