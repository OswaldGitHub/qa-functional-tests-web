*** Settings ***
Library  JSONLibrary

*** Keywords ***
Get locator by page object
    [Arguments]    ${page}   ${locator}
    IF  '${page}' == 'login'
      ${json_obj}=  Load Json From File  resources/pageObjects/commerce/login/loginPage.json
    ELSE IF  '${page}' == 'allowNotification'
      ${json_obj}=  Load Json From File  resources/pageObjects/private/modals/allowNotificationPage.json
    END
    ${locator}=  Get value from JSON  ${json_obj}  $.${locator}
    [return]  ${locator}[0]