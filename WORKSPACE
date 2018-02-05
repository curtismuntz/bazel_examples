###############################
# Cross compiler
###############################
new_http_archive(
    name = "org_linaro_components_toolchain_gcc_5_3_1",
    build_file = "compilers/linaro_linux_gcc_5.3.1.BUILD",
    sha256 = "987941c9fffdf56ffcbe90e8984673c16648c477b537fcf43add22fa62f161cd",
    strip_prefix = "gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf",
    url = "https://bazel-mirror.storage.googleapis.com/releases.linaro.org/components/toolchain/binaries/latest-5/arm-linux-gnueabihf/gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf.tar.xz",
)

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
