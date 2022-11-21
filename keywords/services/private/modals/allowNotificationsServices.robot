*** Settings ***
Library  RequestsLibrary
Library  Selenium2Library

Resource    ${EXECDIR}/resources/pageObjects/pageObjectsProvider.robot

*** Keywords ***
Dismiss modals if present
  ${modalLocator}=  pageObjectsProvider.Get locator by page object  allowNotification  container
  ${allowButtonlLocator}=  pageObjectsProvider.Get locator by page object  allowNotification  allowButton
  Wait Until Element Is Visible    css:${modalLocator}
  Wait Until Element Is Visible    css:${allowButtonlLocator}
  Click Element  css:${allowButtonlLocator}