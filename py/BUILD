load("@pip_requirements//:requirements.bzl", "requirement")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar", "pkg_deb")

py_binary(
    name = "hello",
    srcs = ["hello.py"],
)

pkg_tar(
    name = "hello_py_tar",
    srcs = ["//py:hello"],
    mode = "0755",
    package_dir = "/opt",
    visibility = ["//visibility:public"],
)
