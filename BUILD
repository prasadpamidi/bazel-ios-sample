load("@rules_cc//cc:defs.bzl", "objc_library")
load("@build_bazel_rules_apple//apple:apple.bzl", "apple_xcframework")
load("@rules_swift//swift:swift.bzl", "swift_library")

filegroup(
    name = "ObjcLibHeaders",
    srcs = [
        "ObjcLib/Classes/Util.h",
    ],
)

objc_library(
    name = "ObjcLib",
    srcs = glob([
        "ObjcLib/Classes/*.h",
        "ObjcLib/Classes/*.m",
    ]),
    hdrs = [":ObjcLibHeaders"],
    includes = [
        "ObjcLib/Classes",
    ],
    module_name = "ObjcLib",
    visibility = ["//visibility:public"],
)

swift_library(
    name = "SwiftLib",
    srcs = glob(["SwiftLib/Classes/**/*.swift"]),
    module_name = "SwiftLib",
    tags = ["manual"],
    visibility = ["//visibility:public"],
    deps = [
        ":ObjcLib",
    ],
)

apple_xcframework(
    name = "SwiftLibXCFramework",
    deps = [
        ":SwiftLib",
    ],
    infoplists = ["SwiftLib/Info.plist"],
    ios = {
        "device": ["arm64"],
        "simulator": [
            "x86_64",
            "arm64",
        ],
    },
    minimum_os_versions = {
        "ios": "16.0",
    },
    bundle_id = "com.bazel.ios.sample",
    bundle_name = "SwiftLib",
    visibility = ["//visibility:public"],
)
