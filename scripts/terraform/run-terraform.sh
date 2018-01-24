#!/bin/bash

terraform apply \
  -var-file="aws-creds.tfvars" \
  -var-file="test-env.tfvars"