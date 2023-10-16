*** Settings ***
Library    SeleniumLibrary
Library    RPA.Windows
*** Variables ***

${url}      https://rahulshettyacademy.com/AutomationPractice/
${radio}        //*[contains(text(),'Option4')]


*** Keywords ***
Initialise the browser
    Launch browser
    maximize browser window

Open new window demo
    Click Element    //button[@id='openwindow']
    Click Element    //button[@id='openwindow']
    Click Element    //button[@id='openwindow']
#    Switch Window   new
    Get Window Handles
    Wait Until Element Is Visible    //a[normalize-space()='Access all our Courses']
    Click Element    //a[normalize-space()='Access all our Courses']

LoginToApplication
    click element    xpath://input[@id='checkBoxOption1']
    input text  xpath://input[@id='name']   Devendra
    select checkbox  checkBoxOption2


Launch browser
        ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
        Call Method    ${chrome_options}    add_argument    --no-sandbox
        Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
        Call Method    ${chrome_options}    add_argument    --disable-extensions
        Call Method    ${chrome_options}    add_argument    --disable-gpu
        Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
        Call Method    ${chrome_options}    add_argument    --dns-prefetch-disable
        Call Method    ${chrome_options}    add_argument    window-size\=1920,1080
        Call Method    ${chrome_options}    add_argument    --disable-blink-features\=AutomationControlled
        Call Method    ${chrome_options}    add_argument    --disable-blink-features
        Call Method    ${chrome_options}    add_argument    --disable-infobars
        Call Method    ${chrome_options}    add_experimental_option  useAutomationExtension  ${False}
        ${prefs}  Create Dictionary  credentials_enable_service=${FALSE}  profile.password_manager_enabled=${False}
        Call Method    ${chrome_options}    add_experimental_option  prefs    ${prefs}
        ${userAgent}=    set variable    --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36"
        Call Method    ${chrome_options}    add_argument    ${userAgent}
        ${excluded}    Create List      enable-automation    enable-logging
        Call Method  ${chrome_options}  add_experimental_option  excludeSwitches  ${excluded}
        Create Webdriver    driver_name=Chrome    options=${chrome_options}
        Go To    ${url}   

