*** Settings ***
# Variables    ../env_files/stage.yml

#contains all page resources
Resource    PageFactory.resource

#contains custom assertion added on top on built in robot libraries
Resource    Assertions.resource

#contains static test data such as template name and prices
Resource    ApplicationEnums.resource

#contains test and suite set up and tear down
Resource    basetest.resource

#builtin robot libraries 
Library          OperatingSystem
Library          String
Library    SeleniumLibrary
Library    Collections
Library    DateTime
Library    FakerLibrary
Library           RequestsLibrary
Library           JSONLibrary


#custom python code files for custom keywords outside of built in robot keywords
# Library    ../custom_python_keywords/test_utils.py
# Library    ../custom_python_keywords/custom_keywords_db.py
# Library    ../custom_python_keywords/custom_keywords_api.py
Library    D:\Dev_Progs\Robot_framework_demo\test_utils\test_utils.py

