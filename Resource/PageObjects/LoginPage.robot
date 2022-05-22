*** Settings ***
Documentation    Contains all the Login Page Web Elements/Objects
Library    SeleniumLibrary


*** Keywords ***
Click Login
    Click Button    xPath://div[@class="login-box"]//input[@name="login-button"]

Enter Text Into UserName Field
    [Arguments]    ${input_text}
    Input Text    xPath://div[@class="login-box"]//input[@name="user-name"]    ${input_text}

Enter Text Into Password Field
    [Arguments]    ${input_text}
    Input Text    xPath://div[@class="login-box"]//input[@name="password"]    ${input_text}
