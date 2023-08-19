*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...
...              The system specific keywords created here from our own
...              domain specific language. They utilize keywords provided
...              by the imported SeleniumLibrary.
Library          SeleniumLibrary

*** Variables ***
${user_name}            rahulshettyacademy
${valid_password}       learning
${invalid_password}     123456789
${url}                  https://rahulshettyacademy.com/loginpagePractise/
${shop_url}             https://rahulshettyacademy.com/angularpractice/shop
*** Keywords ***

Open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To               ${url}

Close Browser session
	Close Browser