ARG CENTOS_BUILDER_TAG=7
ARG BUSYBOX_VERSION_TAG=latest

FROM centos:${CENTOS_BUILDER_TAG} AS builder

ARG EPICS_VER=7.0.7

ENV WORK_DIR=/usr/local/epics

ENV USER=epics \
    EPICS_BASE=$WORK_DIR/base

RUN yum update -y

RUN yum install -y wget gcc-c++ readline-devel perl-devel make  \
    && wget --no-check-certificate https://www.aps.anl.gov/epics/download/base/base-$EPICS_VER.tar.gz \
    && tar -zxvf base-$EPICS_VER.tar.gz \
    && mkdir $WORK_DIR \
    && mv base-$EPICS_VER $WORK_DIR \
    && rm base-$EPICS_VER.tar.gz \
    && cd $WORK_DIR \
    && ln -s base-$EPICS_VER base \
    && cd $WORK_DIR/base \
    && make \
    && yum remove -y wget gcc-c++ readline-devel perl-devel make \
    && rm -rf $WORK_DIR/base/src


EXPOSE 5065/tcp 5064/tcp
EXPOSE 5065/udp 5064/udp
COPY launch.sh /opt

ENTRYPOINT ["/opt/launch.sh"]
CMD ["-d", "/db/softioc.db"]
