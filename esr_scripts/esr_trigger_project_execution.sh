#!/bin/bash
# usage: ./esr_trigger_project_execution.sh
. $PWD/esr_scripts/esr_get_token.sh
# Execute Status: running(0) completed(3)
# Status : total/success/fail/skip echo "Starting trigger project execution..."
dateTime=`date '+%Y%m%d%H%M%S'`
echo "execution name is: Suite_$dateTime"
# build execution request body for project executor
execution_request_body="{\"defaultName\":\"Suite_$dateTime\",\"workflowName\":\"Suite_$dateTime\",\"suit\":{\"suits\":[]},\"projectId\":\"$ESR_PROJECT_ID\",\"options\":{\"dynamicRunner\":false}}"
trigger_project_response=$(curl -L -X POST "$ESR_HOST/rest/workflow/suit/start" \
-H "token: $token" \
-H "Content-Type: application/json" --data "$execution_request_body")
echo "Trigger project response: $trigger_project_response"
execution_id=$(echo $trigger_project_response |grep -o '"data": *"[^"]*"' |grep -o '"[^"]*"$'| sed 's/\"//g')
echo execution id is $execution_id
echo $execution_id > execution_id
echo "Successfully trigger project execution..."
