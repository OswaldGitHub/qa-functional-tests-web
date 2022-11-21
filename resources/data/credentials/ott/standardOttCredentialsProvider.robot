*** Settings ***
Library  JSONLibrary
Library  pabot.PabotLib

*** Variables ***
${boundedEnvironment}=

*** Keywords ***
Get OTT user from JSON
    [Arguments]    ${market}   ${environment}   ${type}
    IF  "${environment}" == "preprod"
      ${boundedEnvironment}=  Set variable  prod
    END
    ${json_obj}=  Load Json From File   resources/data/credentials/ott/standardOttCredentials.json
    ${user}=       Get value from JSON    ${json_obj}    $.users[?(@.market=="${market}")].envs[?(@.envType=="${boundedEnvironment}")].users[?(@.type == "${type}")]
    ${value}=     Set variable    ${user}[0]
    [return]  ${value}