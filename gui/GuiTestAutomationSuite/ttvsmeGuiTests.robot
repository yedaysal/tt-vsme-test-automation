*** Settings ***
Resource  ../Data/constants.robot
Library  SeleniumLibrary
Suite Setup  Run Keywords
...  Open Browser  ${URL}  ${BROWSER}
...  AND  Set Selenium Speed  0.5
Suite Teardown  Close All Browsers

*** Test Cases ***

TTVSME Login Test
    
    Title Should Be  VSME GUI
    Input Text  name:username  root
    Input Password  name:password  root
    Click Button  xpath://*[@id="root"]/div[2]/form/button
    Page Should Contain  Home

TTVSME Network Profiles Test
    
    Click Link  xpath://*[@id="root"]/div[1]/a
    Click Link  xpath://*[@id="root"]/nav/ul/li[5]/a
    Page Should Contain  Network Profiles