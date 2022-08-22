FROM slackware64-15.0:0.0.1-a_d_l_n_x
ADD entrypoint.sh /
RUN mkdir /packages /SlackBuilds
VOLUME ["/packages", "/SlackBuilds"]
ENTRYPOINT ["/entrypoint.sh"]
