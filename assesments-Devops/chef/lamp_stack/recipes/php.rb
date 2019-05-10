#
# Cookbook:: .
# Recipe:: php
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package  %w(php libapache2-mod-php php-mcrypt php-mysql) do
    action :install
    only_if {node['platform_family'] == 'debian'}
end


package %w(php php-mysql) do 
    action :install
    only_if {node['platform_family'] == 'rhel'}
end








