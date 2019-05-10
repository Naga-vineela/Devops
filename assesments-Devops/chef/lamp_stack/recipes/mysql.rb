#
# Cookbook:: .
# Recipe:: mysql
#
# Copyright:: 2019, The Authors, All Rights Reserved.


mysql_package = node['lamp_stack']['my_sql_package']

package mysql_package do
    action :install
end



