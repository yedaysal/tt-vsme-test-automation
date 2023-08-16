#!/bin/bash
echo "Starting the upload phase..."
export http_proxy=""
export https_proxy=""
GLOBAL_PROJECT=$1
GLOBAL_HOST=$2
PROJECT_ID=$3
GLOBAL_USER=$4
GLOBAL_PASSWORD=$5



response=$(curl -L -X POST "$GLOBAL_HOST/rest/signin" \
-H 'Content-Type: application/json' \
--data "{\"password\": \"$GLOBAL_PASSWORD\",\"username\": \"$GLOBAL_USER\"}")
echo "Token response: $response"
token=$(echo $response|grep -o '"token": *"[^"]*"' |grep -o '"[^"]*"$'| sed 's/\"//g')
if [ -z $token ];then
    echo Get ESR token error!
    exit 1
fi
curl  -F file=@$GLOBAL_PROJECT.tar.gz -H 'Content-Type: multipart/form-data'  -H "token: $token"  $GLOBAL_HOST/rest/project/upload/$PROJECT_ID

echo "Successfully finished the upload phase..."
