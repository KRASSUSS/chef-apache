#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2021, The Authors, All Rights Reserved.
#


package 'tree'

package 'apache2'

service 'apache2' do
  action [:disable, :start]
end

file '/var/www/html/index.html' do
  content "<h1> Hello, this is working, start the weekend! </h1>
  <h3>
  Hostname: #{node['hostname']}<br>
  IP Adress: #{node['ipaddress']}<br> 
  CPU: #{node['cpu']['0']['mhz']}<br>
  Memory: #{node['memory']['total']}<br>
  </h3>
  "
end

