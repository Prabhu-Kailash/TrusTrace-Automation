*** Settings ***
Documentation    This Test Suite contains all the test cases being executed on Sauce Demo Site

Resource    ../Resource/LoginPage_Actions.robot
Resource    ../Resource/InventoryPage_Actions.robot
Resource    ../Resource/CartPage_Actions.robot

Variables  ../Variables/config.py

Suite Setup    Open Browser    ${UI_URL}    browser=chrome
Suite Teardown    Close Browser

*** Test Cases ***
Sauce Demo - Place a order and checkout
    [Documentation]    This test case places the order and checks out the order
    [Tags]    SauceDemo    Critical    Smoke
    Login Into Website    ${UI_CREDS['username']}    ${UI_CREDS['password']}
    Add Product To Cart And Open Cart
    Checkout Selected Product    ${UI_PRODUCT_DETAILS['firstName']}    ${UI_PRODUCT_DETAILS['lastName']}    ${UI_PRODUCT_DETAILS['postalCode']}
    Validate Order Placed
