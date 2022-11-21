*** Settings ***
Library  RequestsLibrary
Library  Selenium2Library

Resource   ${EXECDIR}/resources/data/pathUrls/pathsUrlProvider.robot
Resource   ${EXECDIR}/resources/data/baseUrls/apiBaseUrlProvider.robot

*** Keywords ***
Navigate to page
  [Arguments]    ${pageName}
  ${baseUrl}=  apiBaseUrlProvider.Get base URL from JSON   directvgoWeb  ${ENVIRONTMENT}
  ${pageUrl}=  pathsUrlProvider.Get path URL from JSON    ${pageName}   ${MARKET}  ${ENVIRONTMENT}
  ${url}=  Catenate   ${baseUrl}/${MARKET}${pageUrl}
  ${options}=  Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()  sys
  Call Method    ${options}  add_argument  --no-sandbox
  Call Method  ${options}  add_argument  --disable-setuid-sandbox
  Open Browser  ${url}  Chrome  chrome_options=${options}
  Maximize Browser Window

Init browser
  ${options}=  Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
  Call Method  ${options}   add_argument    --disable-popup-blocking
  Call Method  ${options}   add_argument    --ignore-certificate-errors
  Call Method  ${options}   add_argument    --ignore-certificate-errors
  ${options}=  Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
  Open Browser  about:blank  ${BROWSER}  options=${options} remote_url=https://oauth-edgar.osg-d0fe4:b0820861-9c14-436f-a9ef-2d8f86791b1e@ondemand.us-west-1.saucelabs.com:443/wd/hub desired_capabilities=DIRECTVGO-Preprod:chrome,platform:Windows 10,browserName:chrome,version:107
  Maximize Browser Window