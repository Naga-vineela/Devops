#
# Cookbook:: lamp_stack
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
# 

if node['platform'] == 'ubuntu' or node['platform'] == 'redhat' 
    include_recipe 'lamp_stack::apache'
    include_recipe 'lamp_stack::php'
    include_recipe 'lamp_stack::phpinfo'
    include_recipe 'lamp_stack::mysql'
elsif
    raise "invalid OS ,cookbook works only on ubuntu and RHEL"
end

