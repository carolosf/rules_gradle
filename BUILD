# This is linked to the http archive because specified a build_file param
filegroup(
    name = 'gradle-files',
    srcs = glob(["**/lib/*.jar"]),
    visibility = ["//visibility:public"]
)

java_import(
    name = "gradle-launcher",
    # The @gradle is the name of the http_archive rule in WORKSPACE
    jars = ["@gradle//:gradle-files"]
)

java_binary(
    name = "gradle",
    jvm_flags = ["-Dorg.gradle.appname=gradle"],
    main_class = "org.gradle.launcher.GradleMain",
    runtime_deps = [":gradle-launcher"],
    visibility = ["//visibility:public"]
)
