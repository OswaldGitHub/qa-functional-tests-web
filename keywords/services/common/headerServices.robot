*** Settings ***
Library  RequestsLibrary
Library  Selenium2Library

Resource    ${EXECDIR}/resources/pageObjects/modulesProvider.robot

*** Keywords ***
Go to private lander
  [Arguments]    ${lander}
  ${landerLocator}=  modulesProvider.Get locator by module  header  privateTabs.${lander}
  Wait Until Element Is Visible    css:${landerLocator}
  Click Element  css:${landerLocator}

Click search bar
  ${landerLocator}=  modulesProvider.Get locator by module  header  searchBar.searchText
  Wait Until Element Is Visible    css:${landerLocator}
  Click Element  css:${landerLocator}

Type on the search bar
  [Arguments]    ${valueToType}
  ${landerLocator}=  modulesProvider.Get locator by module  header  searchBar.searchText
  Input text  css:${landerLocator}  hola
  Click Element  css:${landerLocator}