FROM mstormo/suse
MAINTAINER Tom Xiong<tom.xiong@software.dell.com> 

RUN zypper ar http://demeter.uni-regensburg.de/SLE11SP4-SDK-x64/DVD1/ SLE-DVD1 \
    && zypper ar http://demeter.uni-regensburg.de/SLE11SP4-SDK-x64/DVD2/ SLE-DVD2
	
# Install sles 11 sp4 repository & Refresh repositories & Update System
RUN  \
	zypper --gpg-auto-import-keys --non-interactive ref -fdb \
    || zypper --gpg-auto-import-keys --non-interactive ref -fdb \
    || zypper --gpg-auto-import-keys --non-interactive ref -fdb; \
#&& \
#  zypper --gpg-auto-import-keys --non-interactive update    
# Install Basevm Dependencies
   zypper --non-interactive install --no-recommends --download-in-advance --auto-agree-with-licenses \
	tcpdump \
#	coreutils \
#	grep \
#	pwdutils \
	sudo \
	syslog-ng \
	openssh \
	vim \
	curl \
#RUN zypper --non-interactive install --auto-agree-with-licenses \
	dialog \
#	apparmor-docs \
#	yast2-apparmor \
#	apparmor-profiles \
#	apparmor-utils \
#	apparmor-parser \
#	libapparmor \
#	pmtools \
#	iputils \
	ethtool \
#	libstdc++ \
	libstdc++33 \
	ntp \
	psmisc \
#	apparmor-admin_en \
#RUN zypper --non-interactive install --auto-agree-with-licenses \
	eject \
	file \
	groff \
	ifplugd \
	less \
	libart_lgpl \
#	libgcrypt \
#	libgpg-error \
	libxslt \
	man \
	man-pages \
#	net-snmp \
#	postfix \
	procinfo \
	rrdtool \
#RUN zypper --non-interactive install --auto-agree-with-licenses \	
	sensors \
	telnet \
	usbutils \
	xinetd \
	audit \
	pax \
	cron \
	bind-libs \
	bind-utils \
	cifs-mount \
	binutils \
	expect \
	bc \
	gettext \
	procmail \
	sysstat \
	iptables \
	xfsprogs \
	zip \
	unzip \
	supportutils \
#	open-vm-tools \
	kdump \ 
# - cleanup package manager ------------------------------------------------------------------------
    && zypper --non-interactive clean --all \
# - remove all documentation and anything in /tmp --------------------------------------------------
    && rm -f `find /usr/share/doc/packages -type f |grep -iv "copying\|license\|copyright"` \
    && rm -rf /usr/share/info \
    && rm -rf /usr/share/man \
    && rm -rf /tmp/*	
#RUN cd /tmp && \
#	zypper --non-interactive install libyaml-0-2 && \
#	wget http://download.opensuse.org/distribution/13.2/repo/oss/suse/x86_64/ruby2.1-rubygem-gem2rpm-0.10.1-2.2.3.x86_64.rpm
#    wget ftp://fr2.rpmfind.net/linux/opensuse/distribution/13.2/repo/oss/suse/noarch/ruby-common-2.1-2.1.noarch.rpm && \
#	wget http://download.opensuse.org/distribution/13.2/repo/oss/suse/x86_64/ruby2.1-stdlib-2.1.3-1.1.x86_64.rpm && \
#	wget http://download.opensuse.org/distribution/13.2/repo/oss/suse/x86_64/ruby2.1-2.1.3-1.1.x86_64.rpm && \
#    wget  http://download.opensuse.org/distribution/13.2/repo/oss/suse/x86_64/puppet-3.7.1-1.3.x86_64.rpm && \
#	rpm -iv /tmp/puppet-3.7.1-1.3.x86_64.rpm
	
	