#!/bin/bash
#
# install the puppet yum repo rpm
#
rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
#
# install the puppet package using yum package manager
#
yum install puppet -y
#
# install nginx puppet module using the puppet agent
#
/opt/puppetlabs/bin/puppet module install jfryman/nginx
#
# install wget module for grabbing files from github
#
/opt/puppetlabs/bin/puppet module install maestrodev-wget
#
# grab the nginx.pp manifest
#
wget -P /tmp https://raw.githubusercontent.com/canussie/puppet/master/nginx.pp
#
# run the puppet agent against the manifest
#
#
/opt/puppetlabs/bin/puppet apply /tmp/nginx.pp
