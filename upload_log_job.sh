#!/bin/bash
echo "Uploading log file to S3..."
aws s3 cp /var/log/httpd/access.log s3://your-s3-bucket-name/access.log

if [ $? -eq 0 ]; then
  echo "✅ Upload successful!"
  echo "Clearing log file..."
  sudo truncate -s 0 /var/log/httpd/access.log
else
  echo "❌ Upload failed!"
  exit 1
fi
