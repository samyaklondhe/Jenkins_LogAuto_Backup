# Task 4 - Automated Jenkins Job Triggered by Access Log Size

## Overview
Automates log file management by triggering a Jenkins job when the log exceeds 1GB.
The Jenkins job uploads the log to S3 and clears it after success.

## Requirements
- AWS CLI configured
- S3 bucket
- Jenkins running & API token

## Setup
1. aws s3 mb s3://your-s3-bucket-name
2. aws configure
3. chmod +x monitor_log.sh
4. Create Jenkins Freestyle Job -> Execute Shell -> upload_log_job.sh
5. Schedule cron: */5 * * * * /path/to/monitor_log.sh >> /var/log/monitor_log_output.log 2>&1

## How It Works
- monitor_log.sh checks size
- If >=1GB triggers Jenkins job
- Jenkins uploads & clears log

## Troubleshooting
- Ensure Jenkins user has AWS creds
- Use visudo to allow truncate without password
