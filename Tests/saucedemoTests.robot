*** Settings ***
Documentation    This is some basic info about the whole suite
Library    SeleniumLibrary
Resource    ../Resources/commonApp.robot
Resource    ../Resources/sauceDemoApp.robot
Resource    ../Resources/dataManager.robot
Resource    ../Data/inputData.robot
*** Variables ***


*** Test Cases ***
Shoould be able to log in with valid credantials
    [Documentation]    User should be login
    [Tags]    Smoke
    commonApp.Begin Web Test
    sauceDemoApp.Sign in    ${EMAIL}    ${PASSWORD}
    commonApp.End Web Test


Invalid login scenarios should display correct error messages
    [Template]    sauceDemoApp.Test Negativ Multiple Login Scenarios
    ${WITH_INVALID_USER_NAME}
    ${WITH_INVALID_USER_PASSWORD}
    ${WITH_INVALID_USER_NAME_AND_PASSWORD}
    ${WITH_EMPTY_USER_NAME}
    ${WITH_EMPTY_USER_PASSWORD}
    ${WITH_EMPTY_USER_NAME_AND_PASSWORD}



Should see correct error messages with invalid logins (csv)
    [Tags]    negativ
    ${InvalidLoginScenarious}    dataManager.Get Csv Data    ${INVALID_CREDENTIALS_PATH_CSV}
    sauceDemoApp.Login With Invalid Csv Data    ${InvalidLoginScenarious}














