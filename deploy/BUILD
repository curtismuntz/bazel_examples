load("@io_bazel_rules_docker//container:container.bzl", "container_image")

config_setting(
    name = "rpi",
    values = {"cpu": "rpi"},
)

config_setting(
    name = "tx2",
    values = {"cpu": "tx2"},
)

container_image(
    name = "hello_cpp_image",
    base = select({
        ":tx2": "@tx2_docker_base//image",
        ":rpi": "@rpi_docker_base//image",
        "//conditions:default": "@amd64_docker_base//image",
    }),
    cmd = ["/opt/hello"],
    mode = "777",
    stamp = True,
    tars = ["//cpp:hello_cpp_tar"],
)

container_image(
    name = "hello_py_image",
    base = select({
        ":tx2": "@tx2_docker_base//image",
        ":rpi": "@rpi_docker_base//image",
        "//conditions:default": "@amd64_docker_base//image",
    }),
    cmd = ["/opt/hello.py"],
    mode = "777",
    stamp = True,
    tars = ["//py:hello_py_tar"],
)
