*** Settings ***
Documentation    Contains all the actions to be performed on Inventory Page

Resource   ./PageObjects/InventoryPage.robot

*** Keywords ***
Add Product To Cart And Open Cart
    [Documentation]    Adds product to cart and opens shopping cart
    Click Add To Cart
    Click Shopping Cart