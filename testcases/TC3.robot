*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${url}    https://rahulshettyacademy.com/AutomationPractice/
${dropbox}     //select[@id='dropdown-class-example']
${option2}        //select[@id='dropdown-class-example']/option[2]



*** Keywords ***
User should select all check box
    Click Element    ${dropbox}
    Click Element    ${option2} 


*** Test Cases ***
Open Chrome Browser
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    User should select all check box



