#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2021, The Authors, All Rights Reserved.
#


package 'tree'

package 'apache2' do
  case node['platform']
  when 'centos', 'redhat', 'fedora', 'suse'
    package_name 'httpd'
  when 'debian', 'ubuntu'
    package_name 'apache2'
  when 'arch'
    package_name 'apache'
  end
  action :install
end


if platform?('centos', 'redhat', 'fedora', 'suse')
	service 'httpd' do
	  action [:enable, :start]
	end
end
if platform?('debian', 'ubuntu')
	service 'apache2' do
	  action [:enable, :start]
	end
end
if platform?('arch')
	service 'apache' do
	  action [:enable, :start]
	end
end


template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(
   :name => 'KRASSUSS'
  )
  if platform?('centos', 'redhat', 'fedora', 'suse')
	notifies :restart, 'service[httpd]', :immediately
  end
  if platform?('ubuntu', 'debian')
	notifies :restart, 'service[apache2]', :immediately
  end
  if platform?('arch')
	notifies :restart, 'service[apache]', :immediately
  end
end

