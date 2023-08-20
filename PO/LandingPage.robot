*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary

*** Keywords ***
Fill the login Form
    [Arguments]         ${username}     ${password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        id:signInBtn

