#!/bin/bash
env | sort
#P=itproto
D=$(date '+%Y-%m-%d-%H-%M-%S')
 
#/workspace/jenkins/scoutsuit/bin/scout aws --profile $P || echo "ignore scoutsuite return code $?"
/workspace/jenkins/scoutsuit/bin/scout aws --profile $profile || echo "ignore scoutsuite return code $?"
