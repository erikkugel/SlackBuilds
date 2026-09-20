FROM ghcr.io/erikkugel/slackware64:latest

ARG mirror=https://mirrors.slackware.com/slackware/slackware64-15.0/

RUN echo ${mirror} > /etc/slackpkg/mirrors

RUN slackpkg update && slackpkg upgrade-all || if [ $? = 20 ]; then exit 0; fi

RUN slackpkg install \
 a/* \
 d/* \
 l/* \
 x/* \
 rpm2tgz

RUN cpan install CPAN \
 && cpan reload cpan \
 && cpan App::cpanminus \
 && cpanm Config::Tiny

RUN echo 'https://mirrors.slackware.com/slackware/slackware64-15.0/' > /etc/slackpkg/mirrors

ADD ./jq /tmp/jq 
RUN cd /tmp/jq \
 && /tmp/jq/jq.SlackBuild \
 && installpkg /tmp/jq-*.txz \
 && rm -r -f /tmp/jq /tmp/jq-*.txz

ADD ./gh /tmp/gh
RUN cd /tmp/gh \
 && /tmp/gh/gh.SlackBuild \
 && installpkg /tmp/gh-*.txz \
 && rm -r -f /tmp/gh /tmp/gh-*.txz

ADD --chown=root:root ./Package/entrypoint.sh /
RUN mkdir /SlackBuilds /packages
ENTRYPOINT ["/entrypoint.sh"]

