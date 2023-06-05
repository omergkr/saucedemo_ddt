*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Verify Product Page Loaded
    wait until page contains    Products