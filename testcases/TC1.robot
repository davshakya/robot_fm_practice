*** Settings ***
Resource    ../resource_files/base_data.resource

Suite Setup     Initialise the browser
Suite Teardown      close browser


*** Test Cases ***

LoginTest
    LoginToApplication
    Click element    xpath://input[@value='radio1']
    ${isExist}=  Run Keyword And Return Status    Element Should Be Visible    ${radio}
    Log To Console    ${isExist}

Demo switch window
    LoginToApplication
    Open new window demo


Select element from dropdown list
    sleep  2
    select from list by label  dropdown-class-example   Option1
    sleep   2
    select from list by index  dropdown-class-example   3
    sleep  2
    
    
Enter value into textbox and handle alert
    Input Text    //input[@id='name']    Devendra Sing Shakya
    Sleep    2
    Click Element    //input[@id='alertbtn']
    Sleep    2
#    Handle Alert    accept
#    Handle Alert    dismiss
    Handle Alert    leave
    sleep   2


