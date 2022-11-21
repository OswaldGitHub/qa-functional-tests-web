*** Settings ***
Library  RequestsLibrary
Library  Selenium2Library

Resource   ${EXECDIR}/resources/data/baseUrls/apiBaseUrlProvider.robot
Resource   ${EXECDIR}/resources/data/endpoints/directvgo/directvgoEndPointsProvider.robot

Variables   ${EXECDIR}/config/setup/env.py

*** Variables ***
${boundedEnvironment}=
${language}=

*** Keywords ***
Get all carousels by page
    [Arguments]    ${page}  ${id_token}
    IF  "${ENVIRONTMENT}" == "preprod"
      ${boundedEnvironment}=  Set variable  prod
    END
    IF  "${MARKET}" != "br"
      ${language} =  Set variable  es
    END
    ${baseUrl} =  apiBaseUrlProvider.Get base URL from JSON   directvgoApi  ${ENVIRONTMENT}
    ${directvgoEndpoint} =  directvgoEndPointsProvider.Get directvgo endpoint from JSON  layout  ${ENVIRONTMENT}  pages

    # Create the Session
    Create Session  vrio_session  ${baseUrl}

    ${header} =  create dictionary   Authorization=Bearer ${id_token}  x-client-id=robot  x-client-version=1.0

    # Make the call (and capture the response in a variable)
    ${response} =  GET On Session  vrio_session  ${directvgoEndpoint}  headers=${header}  params=language=${language}

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}  200

    # Check the Response body
    ${json} =  Set Variable  ${response.json()}

    [return]  ${json}
