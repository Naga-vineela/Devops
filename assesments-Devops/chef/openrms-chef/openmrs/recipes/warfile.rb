#
# Cookbook:: .
# Recipe:: warfile
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# restart service

service 'tomcat8' do
   # service_name :tomcat8
    action :nothing
end

remote_file '/tmp/openmrs.war' do
    source 'https://sourceforge.net/projects/openmrs/files/releases/OpenMRS_Platform_2.2.0/openmrs.war'
    mode '0755'
    action :create
end

execute 'unzip_warfiles' do
    command 'unzip -qq /tmp/openmrs.war -d /var/lib/tomcat8/webapps/openmrs/'
    action :run
    not_if { ::File.exist?('/var/lib/tomcat8/webapps/openmrs/index.htm')}
    #notifies :restart, 'service[:tomcat8]', :immediately
end

service 'tomcat8' do
    
     action :restart
 end

