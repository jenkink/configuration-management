#!/bin/bash
yum update -y
yum install httpd -y
service httpd start
chkconfig --add httpd
aws s3 cp --recursive s3://kj-profile/ /var/www/html --region us-east-1
