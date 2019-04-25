#
# Cookbook:: .
# Recipe:: mysql
#
# Copyright:: 2019, The Authors, All Rights Reserved.

mysql_package = node[:openmrs][:sql]

package mysql_package do
    action :install
end
