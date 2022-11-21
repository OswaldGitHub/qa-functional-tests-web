*** Settings ***
Library  JSONLibrary

*** Keywords ***
Get locator by module
    [Arguments]    ${module}   ${locator}
    IF  '${module}' == 'header'
      ${json_obj}=  Load Json From File   resources/pageObjects/private/common/headerModule.json
    END
    ${locator}=  Get value from JSON    ${json_obj}    $.${locator}
    [return]  ${locator}[0]