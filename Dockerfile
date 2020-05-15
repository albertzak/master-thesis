FROM cynipe/gitdags

RUN touch /var/lib/rpm/* && rpm -Uvh http://www.city-fan.org/ftp/contrib/yum-repo/city-fan.org-release-2-1.rhel6.noarch.rpm

RUN touch /var/lib/rpm/* && yum -y update && \
  yum install -y \
    yum-plugin-ovl \
    epel-release \
    libnghttp2 \
    curl

RUN touch /var/lib/rpm/* && yum install -y https://$(rpm -E '%{?centos:centos}%{!?centos:rhel}%{rhel}').iuscommunity.org/ius-release.rpm
RUN touch /var/lib/rpm/* && yum install -y cabextract xorg-x11-font-utils fontconfig && yum clean all
RUN touch /var/lib/rpm/* && yum update -y ca-certificates

RUN rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
