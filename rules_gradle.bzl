def _gradle_build_impl(ctx):
    """
    Builds a gradle project
    """
    srcs = ctx.files.srcs
    inputs = depset(srcs)

    # Define directory to put gradle build output in
    output_dir = ctx.actions.declare_directory("external-gradle-build-dir-" + ctx.attr.name)

#    print(ctx.files.srcs[0].dirname)
    print(output_dir.path)

    # TODO: Migrate to using ctx.actions.run instead of run_shell even though run_shell makes things easier to debug
    ctx.actions.run_shell(
        mnemonic = "ExternalGradleBuild",
#        command = "find .", # Useful for debugging
#        command = "echo %s" % ctx.files.srcs[0].dirname, # Useful for debugging
        command = "export ROOT_DIR=$PWD; cd " + ctx.files.srcs[0].dirname + ";" +
                  "$ROOT_DIR/"+ctx.executable.gradle.path + " " +
                  ctx.attr.build_args + " " +
                  # Force gradle to output build in specified output directory
                  "-PbuildDir=$ROOT_DIR/%s" % output_dir.path + " " +
                  ctx.attr.task,
        inputs = inputs,
        # TODO: Use toolchain
        tools = [ctx.executable.gradle],
        outputs = [output_dir]
    )

    return [
        DefaultInfo(files = depset([output_dir]))
    ]

gradle_build = rule(
    implementation = _gradle_build_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "gradle": attr.label(
            default = Label("@gradle//:gradle"),
            allow_files = True,
            executable = True,
            cfg = "exec"
        ),
        "out": attr.output(),
        "build_args": attr.string(
            mandatory = False,
            default = "--full-stacktrace --no-daemon --no-build-cache --debug --gradle-user-home .gradle-home"
            ),
        "task": attr.string(mandatory = False, default = "build")
    }
)

def _directory_select_impl(ctx):
    """
    Choose a subdirectory from input and put it in output directory
    """
    srcs = ctx.files.srcs
    inputs = depset(srcs)

    output_dir = ctx.actions.declare_directory(ctx.attr.name)

    ctx.actions.run_shell(
        mnemonic = "DirectorySelect",
        # TODO: Probably need some sanity checking here to make sure element 0 exists and is a directory and not a file etc.
        command = "mv " + ctx.files.srcs[0].path + "/" + ctx.attr.source_path + "/* " + output_dir.path + "/",
        inputs = inputs,
        outputs = [output_dir]
    )

    return [
        DefaultInfo(files = depset([output_dir]))
    ]

directory_select = rule(
    implementation = _directory_select_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "source_path": attr.string(mandatory = True),
        "out" : attr.output(),
    }
)

