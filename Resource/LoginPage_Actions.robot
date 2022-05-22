*** Settings ***
Documentation    Contains all the actions to be performed on Login Page

Resource   ./PageObjects/LoginPage.robot

*** Keywords ***
Login Into Website
    [Documentation]    Performs login action with given user name and password
    [Arguments]    ${user}    ${pass}
    Enter Text Into UserName Field    ${user}
    Enter Text Into Password Field    ${pass}
    Click Login