#!/bin/bash
 
# Variables
current_date=$(date +"%Y-%m-%d")
#dir_path="/workspace/jenkins/scoutsuit"
 
# Activate Python Env
cd $dir_path
. bin/activate
echo " Activated python env"
# List of AWS CLI profile names
aws_profiles=("itproto" "nonprod")
 
# Loop through each AWS profile
for profile in "${aws_profiles[@]}"
do
    echo "Running aws command for profile: $profile"
    # Set the AWS CLI profile
    export AWS_PROFILE="$profile"
    aws_account_number=$(aws sts get-caller-identity --profile $profile --output text --query 'Account') # Extract AWS account number
 
    # Command
    scout aws --profile $profile --report-dir $dir_path/ss-$profile-$current_date-$aws_account_number
    echo "Finished for profile: $profile"
    echo "========================================================================="
done
