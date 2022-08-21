workspace(name = "rules_gradle")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

RULES_JVM_EXTERNAL_TAG = "4.2"
RULES_JVM_EXTERNAL_SHA = "cd1a77b7b02e8e008439ca76fd34f5b07aecb8c752961f9640dea15e9e5ba1ca"

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    sha256 = RULES_JVM_EXTERNAL_SHA,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

GRADLE_VERSION = "7.4.2"
GRADLE_SHA = "29e49b10984e585d8118b7d0bc452f944e386458df27371b49b4ac1dec4b7fda"

http_archive(
    name = "gradle",
    build_file = "@//:BUILD",
    strip_prefix = "gradle-%s" % GRADLE_VERSION,
    sha256 = GRADLE_SHA,
    url = "https://services.gradle.org/distributions/gradle-%s-bin.zip" % GRADLE_VERSION,
)

