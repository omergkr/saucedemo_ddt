*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USER_EMAIL}    id=user-name
${USER_PASSWORD}    id=password
${ERROR_MESSAGE}    xpath=//h3

*** Keywords ***
Login
    [Arguments]    ${email}    ${password}
    Fill email field     ${email}
    Fill password field    ${password}
    Click Submit button

Verify Login Page Loaded
    wait until page contains    Swag Labs

Fill email field
    [Arguments]    ${email}
    input text    ${USER_EMAIL}      ${email}


Fill password field
    [Arguments]    ${password}
    input text    ${USER_PASSWORD}     ${password}

Click Submit button
    click button    Login

Verify Login Page Error Message
    [Arguments]    ${expectedErrorMessage}
    element text should be  ${ERROR_MESSAGE}    ${expectedErrorMessage}
