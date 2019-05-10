#
# Cookbook:: .
# Recipe:: apache
#
# Copyright::
# to do for rhel and dubian
apt_update 'update' do
    ignore_failure true
    action :update
    only_if {node['platform'] == 'ubuntu'}
end


webpackage_name = node['lamp_stack']['web_package_name']

package webpackage_name do
    action :install
end

service webpackage_name do
    action :restart
end
