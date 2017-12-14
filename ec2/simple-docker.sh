#!/bin/bash
yum update -y
yum install -y docker
chkconfig --add docker
service start docker
usermod -a -G docker ec2-user
