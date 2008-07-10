#!/bin/sh
#
# post-install.sh
#
# This file sets up a custom repo configuration file in /etc/yum.repos.d to
# redirect all the standard repository locations to a private/internal mirror.
#

##
## EDIT THIS VARIABLE TO REFLECT THE LOCATION OF YOUR PRIVATE YUM REPOSITORY.
##
INTERNAL_REPO="pkgrepo.vittitow.local"


###
##
## LEAVE EVERYTHING BEYOND THIS POINT ALONE UNLESS YOU ARE CREATING A FURTHER
## CUSTOMIZED VERSION OF THIS APPLICATION EZ TEMPLATE.
##
###

mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.ezsave

cat << EOF > /etc/yum.repos.d/CentOS-Base.repo
# CentOS-Base.repo
#
# This repo file has been customized to use a yum repository configured for
# private/internal use.
#

[base]
name=CentOS-\$releasever - Base
baseurl=http://${INTERNAL_REPO}/centos/\$releasever/os/\$basearch
gpgcheck=1
gpgkey=http://${INTERNAL_REPO}/centos/RPM-GPG-KEY-CentOS-5
priority=1
protect=1

#released updates
[updates]
name=CentOS-\$releasever - Updates
baseurl=http://${INTERNAL_REPO}/centos/\$releasever/updates/\$basearch
gpgcheck=1
gpgkey=http://${INTERNAL_REPO}/centos/RPM-GPG-KEY-CentOS-5
priority=1
protect=1

#packages used/produced in the build but not released
[addons]
name=CentOS-\$releasever - Addons
baseurl=http://${INTERNAL_REPO}/centos/\$releasever/addons/\$basearch
gpgcheck=1
gpgkey=http://${INTERNAL_REPO}/centos/RPM-GPG-KEY-CentOS-5
priority=1
protect=1

#additional packages that may be useful
[extras]
name=CentOS-\$releasever - Extras
baseurl=http://${INTERNAL_REPO}/centos/\$releasever/extras/\$basearch 
gpgcheck=1
gpgkey=http://${INTERNAL_REPO}/centos/RPM-GPG-KEY-CentOS-5
priority=1
protect=1

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-\$releasever - Plus
baseurl=http://${INTERNAL_REPO}/centos/\$releasever/centosplus/\$basearch
gpgcheck=1
enabled=0
gpgkey=http://${INTERNAL_REPO}/centos/RPM-GPG-KEY-CentOS-5
priority=2
protect=0
EOF
