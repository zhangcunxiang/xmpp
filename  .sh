#!/bin/bash

##
## Variable Declaration
##

curl --user zhang1:123456 "http://10.0.0.11/owncloud/ocs/v1.php/apps/files_sharing/api/v1/shares" \
     --data 'path=/Photos/test.jpg&shareType=3&permissions=1&name=paris%20photo'
