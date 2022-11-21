*** Settings ***
Library  JSONLibrary

*** Variables ***
${boundedEnvironment}=

*** Keywords ***
Get directvgo endpoint from JSON
    [Arguments]    ${serviceType}   ${environment}   ${endPointName}
    IF  "${environment}" == "preprod"
      ${boundedEnvironment}=  Set variable  prod
    END
    ${json_obj}=  Load Json From File   resources/data/endpoints/directvgo/directvgoEndpoints.json
    ${endPoint}=  Get value from JSON    ${json_obj}   $.endpoints[?(@.name=="${serviceType}")].envs[?(@.env == "${boundedEnvironment}")].endpoint["${endPointName}"]
    ${value}=     Set variable    ${endPoint}[0]
    [return]  ${value}