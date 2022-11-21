*** Settings ***
Library  RequestsLibrary
Library  Selenium2Library

Resource    ${EXECDIR}/resources/data/credentials/credentialsProvider.robot
Resource    ${EXECDIR}/resources/pageObjects/modulesProvider.robot
Resource    ${EXECDIR}/resources/pageObjects/pageObjectsProvider.robot

Variables   ${EXECDIR}/config/setup/env.py


*** Keywords ***
Login by credentials
  [Arguments]    ${credsType}

  ${user}=  credentialsProvider.Get user from JSON   ${MARKET}  ${ENVIRONTMENT}  ${credsType}
  ${userFieldLocator}=  pageObjectsProvider.Get locator by page object  login  userField
  ${passwordFieldLocator}=  pageObjectsProvider.Get locator by page object  login  passwordField
  ${loginButtonLocator}=  pageObjectsProvider.Get locator by page object  login  loginButton

  Wait Until Element Is Visible    css:${userFieldLocator}
  Input Text  css:${userFieldLocator}  ${user}[username]

  Wait Until Element Is Visible  css:${passwordFieldLocator}
  Input Text  css:${passwordFieldLocator}  ${user}[password]

  Wait Until Element Is Visible  css:${loginButtonLocator}
  Click Element  css:${loginButtonLocator}


Wait for login successful
  ${logoLocator}=  modulesProvider.Get locator by module  header  directvGoLogo
  Wait Until Element Is Visible  css:${logoLocator}