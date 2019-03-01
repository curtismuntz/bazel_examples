load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

###############################
# murtis maintained external bazel projects
###############################
http_archive(
    name = "murtis_bazel_tools",
    sha256 = "a6bcb86c7b5ed4c55fddd4b64d9c4916677e758f0fdd7f051f9dbfca8a6a8eee",
    strip_prefix = "bazel_tools-811127f89abd954e3ed4a89e9aa90b468c71c2d4",
    urls = ["https://github.com/curtismuntz/bazel_tools/archive/811127f89abd954e3ed4a89e9aa90b468c71c2d4.tar.gz"],
)

load("@murtis_bazel_tools//tools:github_repo.bzl", "github_repo")
load("@murtis_bazel_tools//tools:deps.bzl", "linter_dependencies")

linter_dependencies()

github_repo(
    name = "murtis_bazel_compilers",
    repo = "bazel_compilers",
    sha256 = "6d0f5efaa3ac073906ef3351da4038bfd081296d6307e0e87c33ffc2cc876a4f",
    tag = "eaafbe4ee813b2d1363e8022eee2218ac3e2da06",
    user = "curtismuntz",
)

load("@murtis_bazel_compilers//compilers:dependencies.bzl", "cross_compiler_dependencies")

cross_compiler_dependencies()

###############################
# Docker
###############################
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "aed1c249d4ec8f703edddf35cbe9dfaca0b5f5ea6e4cd9e83e99f3b0d1136c3d",
    strip_prefix = "rules_docker-0.7.0",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/v0.7.0.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

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
    sha256 = "88deff8db6926746e61cb3c8cee651db978700a7e63c277bdfd9c8277e326de3",
    strip_prefix = "rules_python-88532b624f74ab17138fb638d3c62750b5af5f9a",
    urls = ["https://github.com/bazelbuild/rules_python/archive/88532b624f74ab17138fb638d3c62750b5af5f9a.tar.gz"],
)

load("@io_bazel_rules_python//python:pip.bzl", "pip_import", "pip_repositories")

pip_repositories()

pip_import(
    name = "pip_requirements",
    requirements = "//:requirements.txt",
)

load("@pip_requirements//:requirements.bzl", "pip_install")

pip_install()
