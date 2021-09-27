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

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(
    :name => 'KRASSUSS'
  )
end

