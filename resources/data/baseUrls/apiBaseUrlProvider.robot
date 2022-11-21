*** Settings ***
Library  JSONLibrary

*** Keywords ***
Get base URL from JSON
    [Arguments]    ${name}   ${environment}
    ${json_obj}=  Load Json From File   resources/data/baseUrls/apiBaseUrl.json
    ${url}=  Get value from JSON    ${json_obj}    $.urls[?(@.name=="${name}")].envs.${environment}
    ${value}=  Set variable    ${url}[0]
    [return]  ${value}