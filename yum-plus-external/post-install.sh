#!/bin/sh
#
# post-install.sh
#

###
##
## LEAVE EVERYTHING BEYOND THIS POINT ALONE UNLESS YOU ARE CREATING A FURTHER
## CUSTOMIZED VERSION OF THIS APPLICATION EZ TEMPLATE.
##
###

mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.ezsave

cat << EOF > /etc/yum.repos.d/CentOS-Base.repo
# CentOS-Base.repo

[base]
name=CentOS-\$releasever - Base
mirrorlist=http://mirrorlist.centos.org/?release=\$releasever&arch=\$basearch&repo=updates
gpgcheck=1
gpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-5
priority=1
protect=1

#released updates
[updates]
name=CentOS-\$releasever - Updates
mirrorlist=http://mirrorlist.centos.org/?release=\$releasever&arch=\$basearch&repo=updates
gpgcheck=1
gpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-5
priority=1
protect=1

#packages used/produced in the build but not released
[addons]
name=CentOS-\$releasever - Addons
mirrorlist=http://mirrorlist.centos.org/?release=\$releasever&arch=\$basearch&repo=updates
gpgcheck=1
gpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-5
priority=1
protect=1

#additional packages that may be useful
[extras]
name=CentOS-\$releasever - Extras
mirrorlist=http://mirrorlist.centos.org/?release=\$releasever&arch=\$basearch&repo=updates
gpgcheck=1
gpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-5
priority=1
protect=1

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-\$releasever - Plus
mirrorlist=http://mirrorlist.centos.org/?release=\$releasever&arch=\$basearch&repo=updates
gpgcheck=1
enabled=0
gpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-5
priority=2
protect=0
EOF
