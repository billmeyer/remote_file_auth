#
# Cookbook:: .
# Recipe:: remote_file
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'base64'

# With Chef Vault:
# github_server = infra_secrets['github_server']
# github_user = infra_secrets['github_user']
# github_pw = infra_secrets['github_pw']

# Without Chef Vault:
# github_server = 'http://192.168.33.33/git'
github_server = 'http://localhost/git'
github_user = 'acme'
github_pw = 'automate'

file_checksum = node['fpb']['chef_automate']['ldap_users_file_checksum']

directory '/root/ldap_config' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# For repeative testing purposes, always delete the file we're trying to pull first...
remote_file '/root/ldap_config/automate_ldap_users' do
  action :delete
end

# Now actually pull the remote file using Basic Auth
remote_file '/root/ldap_config/automate_ldap_users' do
  source "#{github_server}/automate_ldap_users"
  owner 'root'
  group 'root'
  mode '0600'
  checksum file_checksum
  headers(Authorization: "Basic #{Base64.encode64("#{github_user}:#{github_pw}").gsub('\n', '')}")
end
