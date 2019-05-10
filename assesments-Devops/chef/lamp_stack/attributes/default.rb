if node['platform_family'] == 'debian'
    default['lamp_stack']['web_package_name'] = 'apache2'
    default['lamp_stack']['my_sql_package'] = 'mysql-server'
elsif  node['platform_family'] == 'rhel'
    default['lamp_stack']['web_package_name'] = 'httpd'
    default['lamp_stack']['my_sql_package'] = 'mariadb-server'
end


default['lamp_stack']['php_info_path'] = '/var/www/html/info.php'
default['lamp_stack']['php_info_content'] = '<?php phpinfo(); ?>'

