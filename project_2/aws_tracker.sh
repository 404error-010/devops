
#!/bin/bash

# Define a function to log messages with timestamps
log_message() {
  local message="$1"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> /home/ubuntu/aws_tracker.log
}

# Log the start of the script
log_message "Starting AWS resource tracking script."

# List S3 buckets
log_message "Listing S3 buckets:"
aws s3 ls >> /home/ubuntu/aws_tracker.log 2>&1

# List EC2 instances
log_message "Listing EC2 instances:"
aws ec2 describe-instances | jq ' .Reservations[].Instances[].InstanceId' >> /home/ubuntu/aws_tracker.log 2>&1

# List Lambda functions
log_message "Listing Lambda functions:"
aws lambda list-functions >> /home/ubuntu/aws_tracker.log 2>&1

# List IAM users
log_message "Listing IAM users:"
aws iam list-users >> /home/ubuntu/aws_tracker.log 2>&1

# Log the end of the script
log_message "AWS resource tracking script completed."
