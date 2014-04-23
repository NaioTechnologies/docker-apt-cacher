FROM ubuntu:13.10

#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list && apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apt-cacher

# allow access from everywhere
RUN echo "allowed_hosts = *" >> /etc/apt-cacher/apt-cacher.conf

# limit disk usage
# TODO: does not work as of now. Seems to interpret as 0 bytes maximum
# RUN echo "disk_usage_limit = 10GB" > /etc/apt-cacher/conf.d/disk.conf

# enable multi-distro support (debian and ubuntu alike)
RUN echo "distinct_namespaces = 1" >> /etc/apt-cacher/apt-cacher.conf

# extend ubuntu release names
# TODO: add ubuntu 14.10 release name and future versions
RUN echo "ubuntu_release_names = dapper, edgy, feisty, gutsy, hardy, intrepid, jaunty, karmic, lucid, maverick, natty, oneiric, precise, quantal, trusty" >> /etc/apt-cacher/apt-cacher.conf

CMD apt-cacher

EXPOSE 3142
VOLUME ["/var/cache/apt-cacher"]
