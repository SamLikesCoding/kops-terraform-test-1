#!/bin/bash

# Script for variable setup

AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
KOPS_STATE_STORE="s3://<State store URI>"
KOPS_STATE_NAME=$(uname -n)".k8s.local" # if you're using gossip cluster

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export KOPS_STATE_STORE
export KOPS_STATE_NAME

clear
echo "Variables are set"
