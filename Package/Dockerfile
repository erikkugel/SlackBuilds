FROM slackware64:latest

ARG mirror=https://mirrors.slackware.com/slackware/slackware64-15.0/

RUN echo ${mirror} > /etc/slackpkg/mirrors

RUN slackpkg update \
 && slackpkg upgrade-all

RUN slackpkg install \
 d/* \
 l/* \
 x/* \
 rpm2tgz

RUN echo 'https://mirrors.slackware.com/slackware/slackware64-15.0/' > /etc/slackpkg/mirrors

ADD --chown=root:root entrypoint.sh /
RUN mkdir /SlackBuilds /packages
ENTRYPOINT ["/entrypoint.sh"]

