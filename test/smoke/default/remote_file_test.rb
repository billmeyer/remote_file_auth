# # encoding: utf-8

# Inspec test for recipe .::remote_file

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/root/ldap_config/automate_ldap_users') do
  it { should exist }
  it { should be_file }
  it { should_not be_directory }
  its('type') { should eq :file }
  its('type') { should_not eq :directory }
  its('content') { should match(/^jake\|admin/) }
  its('content') { should match(/^frank\|admin/) }
  its('content') { should match(/^blake\|admin/) }
end
