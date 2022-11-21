*** Settings ***
Library  RequestsLibrary

Resource    ${EXECDIR}/keywords/services/common/headerServices.robot

*** Keywords ***
I search a value
  [Arguments]    ${valueToSearch}
  headerServices.Click search bar
  headerServices.Type on the search bar  ${valueToSearch}
