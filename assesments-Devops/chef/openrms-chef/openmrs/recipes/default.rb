#
# Cookbook:: openmrs
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

if node[:platform] == 'ubuntu'  
     include_recipe 'openmrs::java8'
     include_recipe 'openmrs::mysql'
     include_recipe 'openmrs::tomcat8'
     include_recipe 'openmrs::warfile'
    

elsif
    raise 'Works only on ubuntu  '
end
