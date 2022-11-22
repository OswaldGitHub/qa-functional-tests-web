*** Settings ***
Library  RequestsLibrary
Library  Selenium2Library

Resource    ${EXECDIR}/keywords/steps/hooks/commonHooks.robot
Resource    ${EXECDIR}/keywords/steps/stepDefinitions/private/common/genericSteps.robot
Resource    ${EXECDIR}/keywords/steps/stepDefinitions/private/feature/search/searchWhenStep.robot
Library    pabot.PabotLib

Test Setup     Full login with user  standard
Test Teardown  Close session

*** Test Cases ***
Open Movie PDP from search
    [Tags]  @dtv0189 @co @cl @ec @pe @ar @uy @br @mx @search @private @smoke @sanity @regression @fullRegression
     Given Log to console  ***************** INDEX: ${PABOTEXECUTIONPOOLID}
#    Given Open Browser  https://directvgo:DTVGo4.Life!@preprod.directvgo.com   firefox
#      And Maximize Browser Window
#      And Wait Until Element Is Visible    css:button.dtv-home-landing-hero-section-button
#      And Click Element  css:button.dtv-home-landing-hero-section-button
#      And sleep  10s
#      And Close browser
#      And Log to console  ***************** INDEX: ${1}

#Play Movie asset from search
#    [Tags]  @dtv0190 @co @cl @ec @pe @ar @uy @br @mx @closeVideo @search @private @smoke @sanity @regression @fullRegression
#     Given Log to console  ***************** INDEX: ${PABOTEXECUTIONPOOLID}
#
#Open Series PDP from search
#    [Tags]  @dtv0191 @co @cl @ec @pe @ar @uy @br @mx @search @private @sanity @regression @fullRegression
#     Given Log to console  ***************** INDEX: ${PABOTEXECUTIONPOOLID}
#
#Play Series asset from search
#    [Tags]  @dtv0192 @co @cl @ec @pe @ar @uy @br @mx @closeVideo @search @private @sanity @regression @fullRegression
#     Given Log to console  ***************** INDEX: ${PABOTEXECUTIONPOOLID}
