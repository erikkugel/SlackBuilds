SlackBuilds
===========

SlackBuilds for Slackware Linux

Written and maintained by Ernest Kugel (erik dot kugel at gmail dot com)

# Why is this here?
Traditional slackbuilds such as SlackBuilds.org are usually for stable software releases and stable Slackware releases. This repository is meant to supplement those: if you'd like to use the latest source code instead, usually directly from srouce controll, or if you need something that works with rolling Slackware release, or if you need something you cannot find through more traditional channels, this is the place for you.

# What's here?
- Latest VLC built as an HTTP daemon, with a dedicated system user, and with System-V init scripts
- Lua without shared libs, with position independent code (as Lua recommends!). Defaults to version 5.1.5 to support VLC, but was tested to build up to version 5.3.0 as well
- FFmpeg which will install and play nice with VLC
- x264 from source control
- xvidxode from source crontol
- a52 decoder version 0.7.2 with shared libs
- DavMail MS Exchange Gateway client
- HipChat client for Atlassian chat platform
- Adobe Flash Player package builder
- More!

# Instructions  
Normally, you'd only need to run the appropriate Slackbuild file and the rest will be taken care of: you will end up with a package under /tmp you may then install with `installpkg` or `pkgtool` or `slackpkg --install`:  
```bash
git clone https://github.com/erikkugel/SlackBuilds.git
cd SlackBuilds/lua
./lua.SlackBuild
installpkg /tmp/lua-5.2.3-x86_64-1.txz
```

If you'd like another version, you can normally adjust the `APP_VER` variable. This will not work for SlackBuilds that build the latest source code from a Git repository, such as FFmpeg or VLC. You can identify those easily since by their `APP_VER=latest`, in which case changing the version will only affect the package name, and not much else.

# To do:  
- Consider switching to a classical SlackBuild variable naming convention (use `VERSION` instead of `APP_VER`, etc).
