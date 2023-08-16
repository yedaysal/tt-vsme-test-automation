#!/bin/bash
# usage:  ./esr_get_token.sh
. $PWD/esr_scripts/esr_variables.sh
echo "Starting get esr token..."

get_token_response=$(curl -L -X POST "$ESR_HOST/rest/signin" \
-H 'Content-Type: application/json' \
--data "{\"password\": \"$ESR_PASSWORD\",\"username\": \"$ESR_USER\"}")
echo "Token response: $get_token_response"
token=$(echo $get_token_response |grep -o '"token": *"[^"]*"' |grep -o '"[^"]*"$'| sed 's/\"//g')
if [ -z $token ];then
    echo Get ESR token error!
    exit 1
fi
echo "token is: "$token
echo "Successfully finished get esr token... "
