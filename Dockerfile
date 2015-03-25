FROM gbeutner/sles-11-sp3-x86_64
MAINTAINER Tom Xiong<tom.xiong@software.dell.com> 

# Install sles 11 sp3 repository & Refresh repositories & Update System
RUN zypper --non-interactive addrepo -G \
  http://ftp5.gwdg.de/pub/opensuse/discontinued/distribution/11.3/repo/oss/suse main && \
  zypper --non-interactive addrepo -G \
  http://download.opensuse.org/distribution/11.3/repo/non-oss/suse/ nonoss && \
  zypper --non-interactive addrepo -G \
  http://download.opensuse.org/update/11.3/suse update && \
  zypper refresh && \
  zypper --gpg-auto-import-keys --non-interactive update  
  
# Install Basevm Dependencies
RUN zypper --non-interactive install --auto-agree-with-licenses \
  vim \
  wget \
  cron \
  ntp \
  sudo \
  iputils \
  iptables \
  sysconfig \
  ruby \
  syslog-ng \
  tcpdump \
  libaio
  
  
