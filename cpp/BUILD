load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar", "pkg_deb")

cc_library(
    name = "hello_lib",
    srcs = ["hello_lib.cpp"],
    hdrs = ["hello_lib.h"],
)

cc_binary(
    name = "hello",
    srcs = ["main.cpp"],
    deps = [":hello_lib"],
)

pkg_tar(
    name = "hello_cpp_tar",
    srcs = ["//cpp:hello"],
    mode = "0755",
    package_dir = "/opt",
    visibility = ["//visibility:public"],
)
