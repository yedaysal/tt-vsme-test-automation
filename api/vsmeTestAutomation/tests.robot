*** Settings ***
Resource  ../Data/constants.robot
Resource  ../Resources/emulator.robot

Test Setup  Set Log Level  DEBUG

*** Test Cases ***

GET SUBSCRIPTION BEFORE CREATE REQUEST
    [Documentation]      Sends get subscription before create request.
    Send API Call Request  ${GET_SUBSCRIPTION_BEFORE_CREATE}  ${SUBSCRIPTIONSERVICE_ENDPOINT}

CREATE SUBSCRIPTION
    [Documentation]      Sends create subscription request.
    Send API Call Request  ${CREATE_SUBSCRIPTION}  ${SUBSCRIPTIONSERVICE_ENDPOINT}

GET SUBSCRIPTION AFTER CREATE REQUEST
    [Documentation]      Sends get subscription after create request.
    Send API Call Request  ${GET_SUBSCRIPTION_AFTER_CREATE}  ${SUBSCRIPTIONSERVICE_ENDPOINT}

TERMINATE SUBSCRIPTION
    [Documentation]      Sends terminate subscription request.
    Send API Call Request  ${TERMINATE_SUBSCRIPTION}  ${SUBSCRIPTIONSERVICE_ENDPOINT}