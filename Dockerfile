FROM ubuntu:trusty
MAINTAINER Simon Vernhes <simon@naio-technologies.com>
# Created from Christian Lück <christian@lueck.tv> apt-cacher dockerfile

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    apt-cacher-ng \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

ADD run.sh /
ENTRYPOINT ["/run.sh"]
CMD []
EXPOSE 3142
VOLUME ["/var/cache/apt-cacher"]
