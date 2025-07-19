#!/bin/bash
LOG_FILE="/var/log/httpd/access.log"
THRESHOLD_MB=1024  # 1GB threshold
JENKINS_URL="http://localhost:8080"
JENKINS_JOB="upload-log-job"
JENKINS_USER="admin"
JENKINS_API_TOKEN="your_api_token_here"

FILE_SIZE_MB=$(du -m "$LOG_FILE" | cut -f1)
echo "Current log size: $FILE_SIZE_MB MB"

if [ "$FILE_SIZE_MB" -ge "$THRESHOLD_MB" ]; then
  echo "Threshold exceeded! Triggering Jenkins job..."
  curl -u "$JENKINS_USER:$JENKINS_API_TOKEN" -X POST "$JENKINS_URL/job/$JENKINS_JOB/build"
else
  echo "Log size under threshold."
fi
