*** Settings ***
Library  RequestsLibrary
Library  Selenium2Library

Resource    ${EXECDIR}/keywords/services/public/loginPageServices.robot
Resource    ${EXECDIR}/keywords/services/private/modals/allowNotificationsServices.robot
Resource    ${EXECDIR}/keywords/services/genericServices.robot

*** Keywords ***
Full login with by credentials type
  [Arguments]    ${credsType}
#  genericServices.Init browser
  genericServices.Navigate to page   login
  loginPageServices.Login by credentials  standard
  #loginPageServices.Wait for login successful
  #Dismiss modals

Dismiss modals
  allowNotificationsServices.Dismiss modals if present
