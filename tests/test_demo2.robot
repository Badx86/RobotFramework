*** Settings ***
Documentation   To validate the Login form
Library         SeleniumLibrary
Test Setup      Open the browser with the Mortgage payment url
Test Teardown   Close Browser session
Resource        resource.robot

*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link.btn.btn-primary

*** Test Cases ***
Validate UnSuccessfull Login
	Fill the login Form     ${user_name}    ${invalid_password}
	Wait Until Element Is Visible       ${Error_Message_Login}
	Verify error message is correct

Validate Cards display in the Shopping Page
	Fill The Login Form     ${user_name}    ${valid_password}
    Wait Until Element Is Visible    ${Shop_page_load}

*** Keywords ***

Fill the login Form
	[Arguments]         ${username}     ${password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        id:signInBtn

Wait Until Element Is located in the page
	[Arguments]                     ${element}
    Wait Until Element Is Visible   ${element}

Verify error message is correct
    ${result}=  Get Text            ${Error_Message_Login}
    Should Be Equal As Strings      ${result}                  Incorrect username/password.
    Element Text Should Be          ${Error_Message_Login}     Incorrect username/password.
