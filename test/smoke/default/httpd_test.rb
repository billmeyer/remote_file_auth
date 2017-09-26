# # encoding: utf-8

# Inspec test for recipe .::httpd

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.
describe port(80) do
  it { should be_listening }
end

describe command('curl http://localhost/git/') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match(/401 Unauthorized/) }
end

describe command('curl -u acme:automate -i http://localhost/git/') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match(%r{^HTTP/1.1 200 OK}) }
end
