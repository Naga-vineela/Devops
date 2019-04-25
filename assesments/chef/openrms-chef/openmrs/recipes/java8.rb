#
# Cookbook:: .
# Recipe:: java8
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# install java8/firefox 

apt_update 'update' do
    ignore_failure true
    action :update
    only_if {node['platform'] == 'ubuntu'}
end

package %w(firefox unzip) do
    action :install
end

package node[:openmrs][:java] do
    action :install
end

#Set JAVA_HOME environemnt variable
#/etc/environment add 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre"'
file = File.open("/etc/environment", "rb")
existingContents = file.read
newContents = existingContents + "JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64/jre'"

file "/etc/environment" do
   content newContents
end

