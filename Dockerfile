FROM java:8

VOLUME  ["/data/teamcity"]
ENV TEAMCITY_DATA_PATH /data/teamcity

ENV TEAMCITY_PACKAGE TeamCity-9.0.4.tar.gz
ENV TEAMCITY_DOWNLOAD https://download.jetbrains.com/teamcity

RUN wget $TEAMCITY_DOWNLOAD/$TEAMCITY_PACKAGE
RUN tar zxf $TEAMCITY_PACKAGE -C /opt
RUN rm -rf $TEAMCITY_PACKAGE

EXPOSE 8111
CMD ["/opt/TeamCity/bin/teamcity-server.sh", "run"]
