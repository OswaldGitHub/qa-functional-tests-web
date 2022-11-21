*** Settings ***
Library  JSONLibrary

*** Variables ***
${boundedMarket}=

*** Keywords ***
Get forgerock endpoint from JSON
    [Arguments]    ${market}   ${environment}
    IF  "${market}" != "br"
      ${boundedMarket} =  Set variable  ssla
    END
    IF  "${environment}" == "preprod"
      ${boundedEnvironment}=  Set variable  prod
    END
    ${json_obj}=  Load Json From File   resources/data/endpoints/forgerock/forgerockEndpoints.json
    ${forgerockEndpoint}=  Get value from JSON    ${json_obj}    $.endpoints[?(@.env=="${boundedEnvironment}")].endpoint..${boundedMarket}
    ${value}=     Set variable    ${forgerockEndpoint}[0]
    [return]  ${value}