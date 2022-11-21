*** Settings ***
Library  JSONLibrary

Resource   ott/specialOttCredentialsProvider.robot
Resource   ott/standardOttCredentialsProvider.robot

*** Variables ***
${user}=

*** Keywords ***
Get user from JSON
    [Arguments]    ${market}   ${environment}   ${type}
    IF  '${type}' == 'standard'
      ${user} =  Get OTT user from JSON   ${market}   ${environment}   ${type}
    ELSE IF  '${type}' == 'frontporch'
      ${user} =  Get special OTT user from JSON   ${market}   ${environment}   ${type}
    END
    [return]  ${user}