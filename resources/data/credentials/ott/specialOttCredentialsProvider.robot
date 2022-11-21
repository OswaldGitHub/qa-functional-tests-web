*** Settings ***
Library  JSONLibrary

*** Keywords ***
Get special OTT user from JSON
    [Arguments]    ${market}   ${environment}   ${type}
    ${json_obj}=  Load Json From File   resources/data/credentials/specialOtt/specialOttCredentials.json
    ${user}=       Get value from JSON    ${json_obj}    $.users[?(@.market=="${market}")].envs[?(@.envType=="${environment}")].users[?(@.type == "${type}")]
    ${value}=     Set variable    ${user}[0]
    [return]  ${value}