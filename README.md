# Overview

## Stahnma's random packages

These are packages I have needed for one reason or another.

Tools

  * [SAWS](https://github.com/donnemartin/saws)


# Building packages
This repo uses automation in [vanagon](https://github.com/puppetlabs/vanagon) to build packages.

## Arguments (position dependent)
More detailed and up to date information can be found in [the vanagon repo](https://github.com/puppetlabs/vanagon#configuration-and-usage)

### project name
The name of the project to build, and a file named <project_name>.rb must be present in configs/projects in the working directory.

### platform name
The name of the platform to build against, and a file named <platform_name>.rb must be present in configs/platforms in the working directory.

Platform can also be a comma separated list of platforms such as platform1,platform2.

### target host [optional]
Target host is an optional argument to override the host selection. Instead of using a vm collected from the pooler, the build will attempt to ssh to target as the root user.

If building on multiple platforms, multiple targets can also be specified using a comma separated list such as host1,host2. If less targets are specified than platforms, the default engine (the pooler) will be used for platforms without a target. If more targets are specified than platforms, the extra will be ignored.

## Example

To build a saws package for Debian 8, Jessie 64bit, first verify the existence and contents of both `configs/projects/pl-createrepo.rb` and `configs/platforms/debian-8-amd64.rb`.

    bundle install
    bundle exec build saws debian-8-amd64

This will access and configure the virtualization engine defined in `configs/platforms/debian-8-amd64.rb`. It will then take the build instructions defined in `configs/projects/saws.rb`, as well as any dependencies that are defined in `configs/components` that are pulled in for the saws project. It will then follow the instructions, building out first any needed dependencies, then the final project. The needed files will then be packaged up in a package compatable with dpkg standards, and make it available locally.

#### PLATFORMS
These are the platforms you'll build your package for. A default list has been provided for you, but there is no guarantee that it will be up to date, or will build all that platforms you care about. Make sure you edit this list to contain the build targets you want.

#### PROJECT
This is the project you want to build. It corresponds to the project file in `configs/projects` in your repo.

# Adding new platforms
New platforms require a new platform entry in configs/platforms. Generally, this is all that needs to happen for a new platform, especially if it's a new version of a platform that already exists. However, if it's a new platform entirely, not just a new version, ther will likely be automation changes that are required. Make sure you know how the package management system on the new platform works, and check the vanagon repo to see if there are any vanagon changes required for this new plaform. If we've done things well, you should receive fairly explicit error messages about where the vanagon automation needs to be updated

# Adding new projects
New projects require an entry in `configs/projects`. A file for anything this project includes, with instructions on how to configure and build it, should also be added to `condigs/components` if it does not already exist. Refer to existing projects in this repo or to [the example in vanagon](https://github.com/puppetlabs/vanagon/tree/master/examples) for more details.
