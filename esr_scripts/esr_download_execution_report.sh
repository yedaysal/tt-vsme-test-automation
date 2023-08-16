#!/bin/bash
# usage: ./esr_download_execution_report.sh
. $PWD/esr_scripts/esr_get_token.sh

while IFS= read -r line; do
    execution_id=$line
done < execution_id

echo "Downloading execution report..."
curl -O -J -X GET "http://$ESR_HOST/rest/download/order/$execution_id" -H "accept: */*" -H "token:$token"

log_ext="_log.zip"

if [ -f "$execution_id$log_ext" ]; then
    echo "$execution_id$log_ext file has been downloaded successfully."
else
    echo "$execution_id$log_ext file has not been downloaded. Please check your configuration."
fi
