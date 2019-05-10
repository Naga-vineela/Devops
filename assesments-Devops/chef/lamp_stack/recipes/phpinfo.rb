#
# Cookbook:: .
# Recipe:: phpinfo
#
# Copyright:: 2019, The Authors, All Rights Reserved.

file node['lamp_stack']['php_info_path'] do
    content node['lamp_stack']['php_info_content']
    action :create
end

service node['lamp_stack']['web_package_name'] do
    action :restart
end