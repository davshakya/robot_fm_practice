*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}  https://rahulshettyacademy.com/AutomationPractice/


*** Test Cases ***
Open Chrome Browser
    Open Browser    ${url}    chrome
    Maximize Browser Window



*** Keywords ***



