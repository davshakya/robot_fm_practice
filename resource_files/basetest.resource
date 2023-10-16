*** Settings ***
Resource    D:\Dev_Progs\Robot_framework_demo\resource_files\GlobalLibrary.resource

*** Keywords ***
Setup The Test

    ${run_time_start}    Get Time
    Set Global Variable    ${run_time_start}
    Launch browser
    IF    ${is_gitlab} == True
        Set Screenshot Directory    ./screenshots/
    ELSE
        Register Keyword To Run On Failure      NONE
    END    
Teardown The Test
    ${run_time_end}    Get Time
    IF    ${is_gitlab} == True
        ${modified_test_name}    Extract Alphabets From Text    ${TEST NAME}
        ${run_time_end}    Extract Number From Text    ${run_time_end}
        ${modified_test_name}    Catenate   SEPARATOR=    ${modified_test_name}     ${run_time_end}
        Run Keyword If Test Failed    Capture Page Screenshot    ${modified_test_name}.png
    END

    Browser Tear Down
    
    IF    ${is_gitlab} == True
        ${exec_time}    Subtract Date From Date    ${run_time_end}    ${run_time_start}
        ${total_exec_time}    Evaluate    ${exec_time}/60
        Insert Test Result In Automation Database
        ...    ${TEST NAME}
        ...    ${TEST DOCUMENTATION}
        ...    ${TEST TAGS}
        ...    ${SUITE NAME}
        ...    ${TEST STATUS}
        ...    ${TEST MESSAGE}
        ...    ${total_exec_time}
        Insert Test Result In Testrail    ${TEST NAME}    ${TEST STATUS}    ${TEST MESSAGE}
    END
    
Browser Tear Down
    IF    ${is_gitlab} == True
        Get Browser Logs
    END
    IF    '${close_browser}' == 'true'
        Close All Browsers
    END
    

# Launch browser
    ${driver_path}=    Get Chrome Driver Path
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
    ${userAgent}=    set variable    --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36"
    Call Method    ${chrome_options}    add_argument    ${userAgent}

    IF    ${is_gitlab} == True
        Call Method    ${chrome_options}    add_argument    --headless\=new
    ELSE
        ${excluded}    Create List      enable-automation    enable-logging
        Call Method  ${chrome_options}  add_experimental_option  excludeSwitches  ${excluded}
    END
    Create Webdriver    driver_name=Chrome    chrome_options=${chrome_options}      executable_path=${driver_path}
    Go To    %{studio.baseurl}
    Delete All Cookies
    Set Selenium Timeout    ${wait_timeout_normal}

Suite Setup Keyword
    Load Env
    ${is_gitlab}    Is Gitlab User
    Set Global Variable    ${is_gitlab}