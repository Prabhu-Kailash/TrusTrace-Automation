*** Settings ***
Documentation    Contains all the actions to be performed on Cart Page

Resource   ./PageObjects/CartPage.robot

*** Variables ***
${thank_you}    THANK YOU FOR YOUR ORDER

*** Keywords ***
Checkout Selected Product
    [Documentation]    Fills required details and checks out the product
    [Arguments]    ${first}    ${last}    ${zip}
    Click Checkout
    Enter Text Into FirstName Field    ${first}
    Enter Text Into LastName Field    ${last}
    Enter Number Into ZipCode Field    ${zip}
    Click Continue
    Click Finish

Validate Order Placed
    ${message}=    Thank You Message
    Should Be Equal    ${message}    ${thank_you}