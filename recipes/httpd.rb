#
# Cookbook:: .
# Recipe:: httpd
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'httpd'

template '/etc/httpd/conf.d/gitdir.conf' do
  source 'gitdir.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

execute 'Generate htpasswd' do
  command 'htpasswd -bc /etc/httpd/.htpasswd acme automate'
  action :run
  not_if 'grep "^acme:" /etc/httpd/.htpasswd'
end

directory '/var/www/html/git' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/var/www/html/git/automate_ldap_users' do
  source 'automate_ldap_users'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

service 'httpd' do
  action %i[start enable]
end
