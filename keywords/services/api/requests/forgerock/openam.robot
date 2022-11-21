*** Settings ***
Library  RequestsLibrary
Library  Selenium2Library

Resource   ${EXECDIR}/resources/data/credentials/credentialsProvider.robot
Resource   ${EXECDIR}/resources/data/baseUrls/apiBaseUrlProvider.robot
Resource   ${EXECDIR}/resources/data/tokens/apiTokenProvider.robot
Resource   ${EXECDIR}/resources/data/endpoints/forgerock/forgerockEndpointsProvider.robot

Variables   ${EXECDIR}/config/setup/env.py

*** Keywords ***
Request forgerock access token service

    # Getting the user, baseUrl, authorizationToken, and forgerockEndpoint from the execution by environment and market
    ${user} =  credentialsProvider.Get user from JSON   ${MARKET}  ${ENVIRONTMENT}  standard
    ${baseUrl} =  apiBaseUrlProvider.Get base URL from JSON   forgeRock  ${ENVIRONTMENT}
    ${authorizationToken} =  apiTokenProvider.Get token from JSON   forgeRock  ${MARKET}  ${ENVIRONTMENT}
    ${endpoint} =  forgerockEndpointsProvider.Get forgerock endpoint from JSON  ${MARKET}  ${ENVIRONTMENT}

    # Create the Session
    Create Session  forgerock_session  ${baseUrl}

    # Building the body and header as a dictionary to use them on the request
    ${body}=    create dictionary   grant_type=password     password=${user}[password]      scope=openid status entitlements vrio       username=${user}[username]       market=${MARKET}
    ${header}=  create dictionary   Authorization=${authorizationToken}    Content-Type=application/x-www-form-urlencoded

    # Make the call (and capture the response in a variable)
    ${response} =  POST On Session  forgerock_session  ${endpoint}  data=${body}    headers=${header}

    # Check the Response status with need to be 200
    Should Be Equal As Strings  ${response.status_code}  200

    # Check the Response body
    ${json} =  Set Variable  ${response.json()}

    [return]  ${json}