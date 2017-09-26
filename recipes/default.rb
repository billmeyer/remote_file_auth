#
# Cookbook:: remote_file_auth
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'remote_file_auth::httpd'
include_recipe 'remote_file_auth::remote_file'
