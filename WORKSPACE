workspace(name = "rules_gradle")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

GRADLE_VERSION = "7.4.2"
GRADLE_SHA = "29e49b10984e585d8118b7d0bc452f944e386458df27371b49b4ac1dec4b7fda"

http_archive(
    name = "gradle",
    build_file = "@//:BUILD",
    strip_prefix = "gradle-%s" % GRADLE_VERSION,
    sha256 = GRADLE_SHA,
    url = "https://services.gradle.org/distributions/gradle-%s-bin.zip" % GRADLE_VERSION,
)

