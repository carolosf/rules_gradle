# Rules Gradle

Bazel rules for building a gradle project using the gradle jar

Doesn't offer caching but at least this is compatible with all gradle projects and plugins and offers a way for 
developers to build gradle projects inside of a bazel mono repo.

For examples on how to use see
[simple gradle example](examples/BUILD.bazel)

Please not that you need to choose a different name for your BUILD file e.g. BUILD.bazel otherwise the gradle build directory clashes with the BUILD file.

If this is not the bazel way - please forgive me for my sins.

Pull requests are welcome.

It is possible to build quarkus projects using this but will create an example in a different repo to keep these rules simple, clean and general purpose.