*** Settings ***
Documentation    This Test Suite contains all the test cases being executed on Sauce Demo Site

Resource    ../API Resources/Routes/posts.robot

Variables  ../Variables/config.py

Suite Setup    Begin Session    ${API_URL}


*** Test Cases ***
Send GET Request To Posts EndPoint
    [Documentation]    Performs Get Request on EndPoint /posts and validates the data received
    [Tags]    API    Critical    Smoke
    ${response}=    Do a GET    /posts
    Validate Response    ${response}    sunt aut facere repellat provident occaecati excepturi optio reprehenderit    title

Send GET Request To Posts EndPoint With Path Variable
    [Documentation]    Performs Get Request on EndPoint /posts with Path variable
    [Tags]    API    Critical    Smoke
    @{path}=    Create List    1
    ${response}=    Do a GET    /posts    ${path}
    Validate Response    ${response}    sunt aut facere repellat provident occaecati excepturi optio reprehenderit    title

Send GET Request To Posts EndPoint With Multiple Path Variable
    [Documentation]    Performs Get Request on EndPoint /posts with Multiple Path variable
    [Tags]    API    Critical    Smoke
    @{path}=    Create List    1    comments
    ${response}=    Do a GET    /posts    ${path}
    Validate Response    ${response}    id labore ex et quam laborum    name

Send GET Request To Posts EndPoint With Query Parameter
    [Documentation]    Performs Get Request on EndPoint /posts with Path variable
    [Tags]    API    Critical    Smoke
    ${response}=    Do a GET    /comments    query=postId=1
    Validate Response    ${response}    id labore ex et quam laborum    name

Send POST Request To Posts EndPoint
    [Documentation]    Performs POST Request on EndPoint /posts and validates the data received
    [Tags]    API    Critical    Smoke
    &{body}=  Create Dictionary  title=foo  body=bar  userId=9000
    &{header}=  Create Dictionary  Cache-Control=no-cache
    ${response}=    Do a POST    /posts    ${body}  ${header}
    Validate Response    ${response}    ${101}    id

Send PUT Request To Posts EndPoint
    [Documentation]    Performs PUT Request on EndPoint /posts and validates the data received
    [Tags]    API    Critical    Smoke
    &{body}=  Create Dictionary  id=1  title=foo  body=bar  userId=1
    &{header}=  Create Dictionary  Cache-Control=no-cache
    @{path}=    Create List    1
    ${response}=    Do a PUT    /posts    ${body}  ${header}  ${path}
    Validate Response    ${response}    1    userId
    
Send PATCH Request To Posts EndPoint
    [Documentation]    Performs PATCH Request on EndPoint /posts and validates the data received
    [Tags]    API    Critical    Smoke
    &{body}=  Create Dictionary  title=DUMMY
    &{header}=  Create Dictionary  Cache-Control=no-cache
    @{path}=    Create List    1
    ${response}=    Do a PATCH    /posts    ${body}  ${header}  ${path}
    Validate Response    ${response}    DUMMY    title

Send DELETE Request To Posts EndPoint
    [Documentation]    Performs DELETE Request on EndPoint /posts and validates the data received
    [Tags]    API    Critical    Smoke
    @{path}=    Create List    1
    ${response}=    Do a DELETE    /posts    ${path}
    Run Keyword if  ${response} != &{EMPTY}    Fail    Response is not empty