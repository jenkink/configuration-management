#!/bin/bash

packer validate $1
packer build $1