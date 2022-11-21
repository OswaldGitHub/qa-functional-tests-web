*** Settings ***
Library  RequestsLibrary
Library  Selenium2Library

Resource    ${EXECDIR}/keywords/services/common/headerServices.robot

*** Keywords ***
I am a customer at private lander
  [Arguments]    ${pageName}
  headerServices.Go to private lander  ${pageName}
  Sleep  3s


