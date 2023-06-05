*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/PO/LoginPage.robot
Resource    ../Data/inputData.robot

*** Keywords ***
Begin Web Test
    open browser   about:blank    ${BROWSER}
    go to    ${URL}

End Web Test
    close browser