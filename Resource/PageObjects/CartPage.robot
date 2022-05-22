*** Settings ***
Documentation    Contains all the Cart Page Web Elements/Objects
Library    SeleniumLibrary


*** Keywords ***
Click Checkout
    Click Button    xPath://div[@class="cart_footer"]//button[@name="checkout"]

Enter Text Into FirstName Field
    [Arguments]    ${input_text}
    Input Text    xPath://div[@class="form_group"]//input[@name="firstName"]    ${input_text}

Enter Text Into LastName Field
    [Arguments]    ${input_text}
    Input Text    xPath://div[@class="form_group"]//input[@name="lastName"]    ${input_text}

Enter Number Into ZipCode Field
    [Arguments]    ${input_text}
    Input Text    xPath://div[@class="form_group"]//input[@name="postalCode"]    ${input_text}

Click Continue
    Click Button    xPath://div[@class="checkout_buttons"]//input[@name="continue"]

Click Finish
    Click Button    xPath://div[@class="cart_footer"]//button[@name="finish"]

Thank You Message
    ${header_text}=    Get Text    xPath://h2[@class="complete-header"]
    [Return]    ${header_text}
    
