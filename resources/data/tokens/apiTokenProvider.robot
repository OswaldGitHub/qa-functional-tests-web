*** Settings ***
Library  JSONLibrary

Variables   ${EXECDIR}/library/environment.py


*** Variables ***
${boundedMarket}=
${boundedEnvironment}=

*** Keywords ***
Get token from JSON
    [Arguments]    ${name}   ${market}   ${environment}
    IF  "${market}" != "br"
      ${boundedMarket}=  Set variable   ssla
    END
    IF  "${environment}" == "preprod"
      ${boundedEnvironment}=  Set variable  prod
    END
    ${json_obj}=  Load Json From File   resources/data/tokens/apiTokens.json
    ${token}=     Get value from JSON    ${json_obj}    $.tokens[?(@.name=="${name}")].${boundedEnvironment}.${boundedMarket}
    ${value}=     Set variable    ${token}[0]
    [return]  ${value}


