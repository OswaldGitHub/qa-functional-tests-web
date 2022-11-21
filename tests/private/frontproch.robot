*** Settings ***
Resource    ${EXECDIR}/keywords/steps/hooks/commonHooks.robot
Resource    ${EXECDIR}/keywords/steps/stepDefinitions/private/common/genericSteps.robot
Resource    ${EXECDIR}/keywords/steps/stepDefinitions/private/feature/search/searchWhenStep.robot
Library    pabot.PabotLib

Test Setup  Full login with user  standard
Test Teardown  Close session

*** Test Cases ***
Home lander correctly displayed for frontporch users
    [Tags]  @dtv0762 @co @cl @ec @pe @ar @uy @br @mx @frontporch @private @regression @fullRegression
     Given Log to console  ***************** INDEX: ${PABOTEXECUTIONPOOLID}

#Live lander correctly displayed for frontporch users
#    [Tags]  @dtv0763 @co @cl @ec @pe @ar @uy @br @mx @frontporch @private @regression @fullRegression
#     Given Log to console  ***************** INDEX: ${PABOTEXECUTIONPOOLID}
#
#Play a movie asset from a lander as a frontporch user
#    [Tags]  @dtv0765 @co @cl @ec @pe @ar @uy @br @mx @frontporch @private @smoke @sanity @regression @fullRegression
#     Given Log to console  ***************** INDEX: ${PABOTEXECUTIONPOOLID}
#
#Play a series asset from a lander as a frontporch user
#    [Tags]  @dtv0766: Play a series asset from a lander as a frontporch user
#     Given Log to console  ***************** INDEX: ${PABOTEXECUTIONPOOLID}
#
#Play a live asset from a lander as a frontporch user
#    [Tags]  @dtv0767 @co @cl @ec @pe @ar @uy @br @mx @frontporch @private @smoke @sanity @regression @fullRegression
#     Given Log to console  ***************** INDEX: ${PABOTEXECUTIONPOOLID}