SlackBuilds
===========

SlackBuilds for Slackware Linux

Written and maintained by Ernest Kugel (erik dot kugel at gmail dot com)

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
- Add a cache to prevent redownloading of source code (can be cumbersome with large projects like VLC).
- Add support for detecting the amount of threads the CPU supports and passing this to make with `make -j #`.
- Consider switching to a classical SlackBuild variable naming convention (use `VERSION` instead of `APP_VER`, etc).
- Submit to SlackBuilds.org.
