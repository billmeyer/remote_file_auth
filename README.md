# remote_file_auth

Cookbook to demonstrate using the `remote_file` Chef Resource to pull a file from a
URL that is secured with Basic Auth authentication.

Use Test Kitchen to spin up the Centos-7.3 VM, install Apache HTTPd, configure a secured 
directory, and a htpasswd file, and then run the `remote_file` resource with the appropriate
Basic Auth credentials.