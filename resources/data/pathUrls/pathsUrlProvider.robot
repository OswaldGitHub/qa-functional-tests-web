*** Settings ***
Library  JSONLibrary

Variables   ${EXECDIR}/library/environment.py

*** Variables ***
${boundedMarket}=
${boundedEnvironment}=

*** Keywords ***
Get path URL from JSON
    [Arguments]    ${urlName}   ${market}   ${environment}
    IF  "${market}" != "br"
      ${boundedMarket}=  Set variable   ssla
    END
    IF  "${environment}" == "preprod"
      ${boundedEnvironment}=  Set variable  prod
    END
    ${json_obj}=  Load Json From File   resources/data/pathUrls/pathsUrl.json
    ${url}=     Get value from JSON    ${json_obj}    $.urls[?(@.env=="${boundedEnvironment}")].urlName[?(@.name == "${urlName}")].envs..${boundedMarket}
    ${value}=     Set variable    ${url}[0]
    [return]  ${value}


