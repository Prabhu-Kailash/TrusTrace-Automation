*** Settings ***
Documentation    Contains all the Inventory Web Elements/Objects
Library    SeleniumLibrary


*** Keywords ***
Click Add To Cart
    Click Element    xPath://div[@class='inventory_list']//button[@name='add-to-cart-sauce-labs-backpack']

Click Shopping Cart
    Click Element    xPath://a[@class="shopping_cart_link"]
