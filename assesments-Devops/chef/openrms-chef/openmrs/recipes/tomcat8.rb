#
# Cookbook:: .
# Recipe:: tomcat8
#
# Copyright:: 2019, The Authors, All Rights Reserved.

tomcat_package = node[:openmrs][:tomcat]

package tomcat_package do
    action :install
end

#tomcat8 user.xml file update
template '/etc/tomcat8/tomcat-users.xml' do
    source 'tomcat-users.xml.erb'
   
    action :create
end

# restart service

service 'tomcat8' do
    action :nothing
end

directory '/usr/share/tomcat8/.OpenMRS' do 
    owner 'tomcat8'
    group 'tomcat8'
    mode '0750'
    action :create
    notifies :stop, 'service[tomcat8]', :immediately
    notifies :start, 'service[tomcat8]', :immediately
    notifies :restart, 'service[tomcat8]', :immediately
end

directory '/var/lib/tomcat8/webapps/openmrs' do
    action :create
end


    
#include_recipe 'ark::default'

#ark 'get_jar_file' do
#    url  "https://sourceforge.net/projects/openmrs/files/releases/OpenMRS_Platform_2.2.0/openmrs.war'"
#    path "/var/lib/tomcat8/webapps/openmrs/"
#    creates "openmrs.war"
#    owner "tomcat"
#    action :put
#    notifies :restart, 'service[:tomcat_package]', :immediately
#end
