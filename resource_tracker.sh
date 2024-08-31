#!/bin/bash

echo "Current date and time: $(date '+%Y-%m-%d %H:%M:%S')"
set -x

#list s3 buckets

echo "print list of s3 buckets"
aws s3 ls

#list ec2 instances

echo "print list of ec2 instances"

aws ec2 describe-instances | jq ' .Reservations[].Instances[].InstanceId'

# list lambda

echo "print list of lambda functions"

aws lambda list-functions

# list iam users

echo "print the list of iam users"

aws iam list-users
