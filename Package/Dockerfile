FROM slackware64-15.0:latest
ADD entrypoint.sh /
RUN mkdir /packages /SlackBuilds
VOLUME ["/packages", "/SlackBuilds"]
ENTRYPOINT ["/entrypoint.sh"]
