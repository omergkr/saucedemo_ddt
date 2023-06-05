*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/PO/LoginPage.robot
Resource    ../Resources/PO/ProductsPage.robot
Resource    ../Resources/commonApp.robot


*** Keywords ***
Sign in
    [Arguments]    ${email}    ${password}
    LoginPage.Verify Login Page Loaded
    LoginPage.Login  ${email}    ${password}
    ProductsPage.Verify Product Page Loaded


Test Negativ Multiple Login Scenarios
    [Arguments]    ${Credentials}
    commonApp.Begin Web Test
    LoginPage.Verify Login Page Loaded
    LoginPage.Login    ${Credentials.email}    ${Credentials.password}
    LoginPage.Verify Login Page Error Message    ${Credentials.errorMessage}
    commonApp.End Web Test

Login With Invalid Csv Data
    [Arguments]    ${InvalidLoginScenarious}
    FOR    ${LoginScenario}    IN      @{InvalidLoginScenarious}
        run keyword and continue on failure    commonApp.Begin Web Test
        run keyword and continue on failure    LoginPage.Verify Login Page Loaded
        run keyword and continue on failure    LoginPage.Login    ${LoginScenario}[0]   ${LoginScenario}[1]
        run keyword and continue on failure    LoginPage.Verify Login Page Error Message    ${LoginScenario}[2]
        run keyword and continue on failure    commonApp.End Web Test
    END

