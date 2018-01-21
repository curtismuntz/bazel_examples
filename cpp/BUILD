package(default_visibility = ["//visibility:public"])

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
