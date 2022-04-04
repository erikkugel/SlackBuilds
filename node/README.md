# Important !!! Note re. Slackware current as of March 2022.

NodeJS is now officially part of the Slackware Current distro and will likely be part of Slackware 15.1.

If you are using Slackware Current, using this SlackBuild will clobber your system, which is probably -not- something you want. If this does happen, uninstall this package and reinstall with `slackpkg`:

    # removepkg /tmp/node-*-1_x.txz
    # slackpkg reinstall nodejs

