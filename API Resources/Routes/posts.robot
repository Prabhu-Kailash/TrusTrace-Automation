*** Settings ***
Documentation    This Test Suite contains all the test cases being executed on Sauce Demo Site

Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

Variables  ../Variables/config.py


*** Keywords ***
Begin Session
    [Arguments]    ${url}
    Create Session  mysession  ${url}  verify=true

Do a GET
    [Documentation]    Performs Get Request on given EndPoint
    [Arguments]    ${uri}    ${path}=None    ${query}=None
    IF    ${path} == None
        IF    "${query}" == None
            ${response}=  GET On Session  mysession  ${uri}
        ELSE
            ${response}=  GET On Session  mysession  ${uri}    params=${query}
        END
    ELSE
        ${path}=    Evaluate    "/".join(${path})
        IF    "${query}" == None
            ${response}=  GET On Session  mysession  ${uri}/${path}
        ELSE
            ${response}=  GET On Session  mysession  ${uri}/${path}    params=${query}
        END
    END
    Status Should Be  200  ${response}  #Check Status as 200
    [Return]    ${response}

Do a POST
    [Documentation]    Performs POST Request on given EndPoint
    [Arguments]    ${uri}    ${body}    ${header}    ${path}=None
    IF    ${path} == None
        ${response}=    POST On Session    mysession    ${uri}    data=${body}    headers=${header}
    ELSE
        ${path}=    Evaluate    "/".join(${path})
        ${response}=    POST On Session    mysession    ${uri}/${path}    data=${body}    headers=${header}
    END
    Status Should Be  201  ${response}  #Check Status as 201
    [Return]    ${response}

Do a PUT
    [Documentation]    Performs PUT Request on given EndPoint
    [Arguments]    ${uri}    ${body}    ${header}    ${path}=None
    IF    ${path} == None
        ${response}=    PUT On Session    mysession    ${uri}    data=${body}    headers=${header}
    ELSE
        ${path}=    Evaluate    "/".join(${path})
        ${response}=    PUT On Session    mysession    ${uri}/${path}    data=${body}    headers=${header}
    END
    Status Should Be  200  ${response}  #Check Status as 200
    [Return]    ${response}

Do a PATCH
    [Documentation]    Performs PATCH Request on given EndPoint
    [Arguments]    ${uri}    ${body}    ${header}    ${path}=None
    IF    ${path} == None
        ${response}=    PATCH On Session    mysession    ${uri}    data=${body}    headers=${header}
    ELSE
        ${path}=    Evaluate    "/".join(${path})
        ${response}=    PATCH On Session    mysession    ${uri}/${path}    data=${body}    headers=${header}
    END
    Status Should Be  200  ${response}  #Check Status as 200
    [Return]    ${response}

Do a DELETE
    [Documentation]    Performs DELETE Request on given EndPoint
    [Arguments]    ${uri}    ${path}=None
    IF    ${path} == None
        ${response}=    DELETE On Session    mysession    ${uri}
    ELSE
        ${path}=    Evaluate    "/".join(${path})
        ${response}=    DELETE On Session    mysession    ${uri}/${path}
    END
    Status Should Be  200  ${response}  #Check Status as 200
    [Return]    ${response.json()}

Validate Response
    [Documentation]    Validate the success response returned from the request
    [Arguments]    ${response}    ${value}    ${key}
    #Check Title as expected text from Response Body
    ${is list}=      Evaluate     isinstance(${response.json()}, list)
    IF    ${is list}
        ${title}=  Get Value From Json  ${response.json()}[0]  ${key}
    ELSE
        ${title}=  Get Value From Json  ${response.json()}  ${key}
    END
    ${titleFromList}=  Get From List   ${title}  0
    Should be equal  ${titleFromList}  ${value}
    

    