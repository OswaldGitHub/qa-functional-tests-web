*** Settings ***
Library  RequestsLibrary
Library  Selenium2Library

Resource    ${EXECDIR}/keywords/services/custom/authenticationServices.robot

*** Keywords ***
Full login with user
  [Arguments]    ${credsType}
  authenticationServices.Full login with by credentials type  ${credsType}

Close session
  # TODO  All neccesary to close correctly a session
  Close browser