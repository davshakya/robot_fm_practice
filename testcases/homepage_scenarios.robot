*** Settings ***
Resource    D:\Dev_Progs\Robot_framework_demo\resource_files\GlobalLibrary.resource
Suite Setup    Suite Setup Keyword
Test Setup    Setup The Test
Test Teardown    Teardown The Test
Test Timeout    10 minutes
Test Tags    homepage

*** Test Cases ***
Author : Siva| Scenario: Verify Template Search For Correct Template Name
    [Tags]    template    component    critical    bdd
    Given User is on studio homepage
    When User search template with search Keyword "Ola"
    Then Search Results should show "Ola" template as first template

Author : Siva| Scenario:Verify If The all elements are displayed
    [Tags]    template    component    critical    testrailcaseid    bdd
    Given Navigate to Home Page
    Then All elements should dispalyed on homepage

Author : Siva| Scenario:Verify that User is able to apply filter by category
    [Tags]    template    component    critical    prodbug    bdd
    [Documentation]    bug is reported here-  https://tracker.builder.ai/#/projects/720?storyId=1206631 
    Given User is on studio homepage
    When From sidebar_filter user choosen category ${business_n_finance}
    Then Templates should displayed on choosen catagory ${business_n_finance}

Author : Siva| Scenario:Verify that User is able to sort templates
    [Tags]    template    component    critical    testrailcaseid    bdd
    Given User is on studio homepage
    When User sorting the templates by A_to_Z order
    Then All templates should displayed in alphabetical order

Author : Siva| Scenario:Verify that User is able to sort templates in reverse order
    [Tags]    template   component   critical    C1234    smokebdd
    Given User is on studio homepage
    When User sorting the templates by Z_to_A order
    Then All templates should displayed in reverse alphabetical order


Author : Siva| Scenario:Verify the sorting Of templates allType templates alltogether A_to_Z order
    Given User is on studio homepage
    Then User sorting the templates by alphabetical A_to_Z 


Author : Siva| Scenario:Verify the sorting Of templates allType templates alltogether Z_to_A order
    [Tags]    template    component    critical    bdd
    Given User is on studio homepage
    Then User sorting the templates by alphabetical Z_to_A


Author : Siva| Scenario:Verify that User is able to sort templates by cost high to low order
    [Tags]    template    component    critical    testrailcaseid    bdd
    Given User is on studio homepage
    When User sorting the templates by cost high to low order
    Then All templates should displayed in high_cost to low_cost order


Author : Siva| Scenario:Verify that User is able to sort templates by cost low to high order
    [Tags]    template    component    critical    testrailcaseid    bdd
    Given User is on studio homepage
    When User sorting the templates by cost low to high order
    Then All templates should displayed in low_cost to high_cost order


Author : Siva| Scenario:Verify that for a single template price is correct
    [Tags]    template    component    critical    bdd
    Given User is on studio homepage
    When User search template with search Keyword "${pro_template}"
    Then Price of template is correct

Author : Siva| Scenario:Verify that User is able to apply filter by tab Pro
    [Tags]    template    component    critical    component
    Given User is on studio homepage
    When User clicked on tab ${templates_types.StudioPro}
    Then All Pro Templates should dispayed after selected ${templates_types.StudioPro}
    

Author : Siva| Scenario:Verify that User is able to apply filter by tab Store
    [Tags]    template    component    critical    bdd
    Given User is on studio homepage
    When User clicked on tab ${templates_types.StudioStore}
    Then All store Templates should dispayed after selected ${templates_types.StudioStore}
    

Author : Siva| Scenario:Verify If The all elements of template are enabled and able to create custom template
    [Tags]    template    component    critical    bdd
    Given User is on studio homepage
    When User clicked on add custom template button
    Then User should able to create custom template


 Author : Siva| Scenario:Verify that User is able to signUp using social media
     [Tags]    template    component    critical    bdd
    Given Navigate To SignIn Popup
    Then User should able to redirect to social media page ${webpage_title.signup}


 Author : Siva| Scenario:Verify that User is able to signIn using social media
     [Tags]    template    component    critical    bdd
    Given Navigate To SignIn Popup
    Then User should able to redirect to social media page ${webpage_title.signIn} 


 Author : Siva| Scenario:Verify the cost of template on homepage and view details page
     [Tags]    template    component    critical    bdd
    Given User is on studio homepage
    Then User verify the price on the homepage as well as the View deatail page


Author : Siva| Scenario:Verify user cannot select more than 3templates and check count of selected templates on homePage
    [Tags]    template    component    critical    bdd
    Given Navigate to Home Page
    Then User should not add more than 3templates


Author : Siva| Scenario:Verify Search Templates By Description
    [Tags]    template    component    critical    bdd
    Given Navigate to Home Page
    Then User should verify the suggestion after Search the template with description


Author : Siva| Scenario:Verify Case Search Template Then Close It Then Sort Then Clear Template
    [Tags]    template    component    critical    bdd
    Given Navigate to Home Page    
    Then User should Search Template Then Close It Then Sort Then Clear Template

Author : Abhishek | Scenario: Verify user can see same cost for the template with multipliers 
    [Tags]    homepage      multipliercost    stageonly
    Given Navigate to Home Page
    When User navigates to the template page without multiplier promo
    Then The User is able to see the "${pro_template}" with template cost as original price
    When User navigates to the template page with same cost multiplier promo as "${same_price_multiplier}"
    Then The User is able to see the "${pro_template}" with template cost as original price


Author : Siva| Scenario: Verify That User Can Login From Pro Template Expand View And Create BuildCard
    Given Navigate to Home Page
    Then User Can Login From Pro Template View And Create BuildCard  ${expand_view}


Author : Siva| Scenario: Verify That User Can Login From Pro Template Quick View And Create BuildCard
    Given Navigate to Home Page
    Then User Can Login From Pro Template View And Create BuildCard  ${quick_view}






