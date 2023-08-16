*** Settings ***
Resource  ../Data/constants.robot

Library  RequestsLibrary
Library  Collections
Library  SeleniumLibrary
Library  String
Library  SoapLibrary
Library  OperatingSystem
Library  XML


*** Keywords ***

Send API Call Request
    [Arguments]  ${api_name}  ${endpoint}
    Create Session    mysession    ${BASE_URL}
    ${body}=    Get Xml File    ${api_name}
    ${header}=    Create Dictionary  Content-Type=application/xml
    ${response}=    POST On Session    mysession    /${endpoint}   data=${body}    headers=${header}
    Log To Console    ${response.status_code}
    ${status_code}=   Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200


Get Xml File
    [Arguments]  ${api_name}
    ${xml}=  Get File       ${CURDIR}/XML/${api_name}.xml
    [Return]                ${xml}
