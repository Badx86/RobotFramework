*** Settings ***
Documentation   To validate the Login form
Library         SeleniumLibrary
Library         Collections
Library         BuiltIn
Library         ../customLibraries/Shop.py
Test Setup      Open the browser with the Mortgage payment url
Test Teardown   Close Browser session
Resource        ../PO/Generic.robot
Resource        ../PO/LandingPage.robot
Resource        ../PO/ShopPage.robot


*** Variables ***
@{listOfProducts}           Blackberry      Nokia Edge      Samsung Note 8      iphone X

*** Test Cases ***
Validate UnSuccessfull Login
    LandingPage.Fill the login Form     ${user_name}    ${invalid_password}
    LandingPage.Wait Until Element Is located in the page
    LandingPage.Verify error message is correct

Validate Cards display in the Shopping Page
    LandingPage.Fill The Login Form     ${user_name}    ${valid_password}
    ShopPage.Wait Until Element Is located in the page
    ShopPage.Verify Card titles in the Shop page
    Add Items To Card And Checkout         ${listOfProducts}
#    Sleep    3

Select the Form and navigate to Child window
    LandingPage.Fill The Login Details and Login Form
