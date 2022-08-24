SlackBuilds
===========

SlackBuilds for Slackware Linux

Written and maintained by Ernest Kugel (erik dot kugel at gmail dot com).

# TL;DR 
Normally, you'd only need to run the appropriate Slackbuild file and the rest will be taken care of: you will end up with a package under `/tmp` you may then install with `installpkg` or `pkgtool`

# Prerequisites

## Slackware Linux
The SlackBuild scripts require Slackware Current or the latest stable Slackware release (they are expected to work on both Slackware and Slackware64 but testing on non-64 bit Slackware OS is not guranteed).

## Software & Library Packages
All SlackBuilds were tested on a _full_ Slackware installation with all package categories in place. If you don't have a _full_ installation on hand, for the most part, you will need the _a_, _d_, _l_, _n_ and _x_ package categories. The _x_ category is only required for packages that build against X libraries, and in some situtation, an even leaner build environment could suffice. In some cases, you might need software from other categories. One hard requirement for all SlackBuilds is BASH ;-)

## Non-native dependecies
In cases where a non-Slackware native dependency is required (One that is not available from the Slackware mirrors), the dependency will (almost always) have its own SlackBuild. Ideally, in those cases, you will find a `dependencies.txt` file listing each dependency's name on its own line. For instance, the [`alttab` Slackbuild](alttab/alttab.SlackBuild) requires `uthash` which does not ship with Slackware. `uthash` is therefore listed under [`alttab`'s `dependencies.txt`](alttab/dependencies.txt) and should be built with the [`uthash`'s Slackbuild](uthash/uthash.SlackBuild) and installed before `alttab` is built.

# Docker Build Runtime
A Docker image using a Slackware64 base image can be used for situations where building natively on the host or using a Slackware virtual machine is not desireable:

Pull the `slackbuild` image:

```docker pull ghcr.io/erikkugel/slackbuild:0.0.1```

Run the image with the following parameters:
1. The SlackBuilds repository as a Docker volume under `/SlackBuilds` with read/write permissions
1. The packages output volume under `/packages` with read/write permissions
1. An argument of a comma-delimited string containing a list of packages to build, with dependecies listed first

## Example
Build the `alttab` package atop its `uthash` dependency:

```docker run -v /home/erikkugel/src/SlackBuilds:/SlackBuilds -v /tmp/packages:/packages slackbuild:0.0.1 "uthash,alttab"```

## About the `slackbuild` Docker Image
The `slackbuild` image is built using [this Dockerfile](Package/Dockerfile) and a [vanilla latest stable Slackware64 image](https://github.com/users/erikkugel/packages/container/package/slackware64-15.0) containing the _a_, _d_, _l_, _n_ and _x_ package categories as base.

# Questions, Comments & Feedback
Questions, comments, feedback, inquiries about contributing, or any other constructive communications are welcome on GitHub or via email.

<a href="http://www.wtfpl.net/"><img
        src="http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-4.png"
        width="80" height="15" alt="WTFPL" /></a>
