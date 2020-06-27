*** Settings ***
Documentation     Test
Library           SeleniumLibrary


*** Variables ***
${URL}            http://127.0.0.1:5000/
${BROWSER}        chrome


*** Test Cases ***
Test If Opens
    [Documentation]    Basic funcionality
    [Tags]    GUI
    Launch Browser
    Close Browser

Test Addition
    [Documentation]    Basic funcionality
    [Tags]    GUI, LOGIC
    Launch Browser
    Fill Out Form   1   2   0
    Check Answer  3.0
    Close Browser

Test Substraction
    [Documentation]    Basic funcionality
    [Tags]    GUI, LOGIC
    Launch Browser
    Fill Out Form   4   3   1
    Check Answer  1.0
    Close Browser

Test Multiplication
    [Documentation]    Basic funcionality
    [Tags]    GUI, LOGIC
    Launch Browser
    Fill Out Form   1   2   2
    Check Answer  2.0
    Close Browser

Test Division
    [Documentation]    Basic funcionality
    [Tags]    GUI, LOGIC
    Launch Browser
    Fill Out Form   1   2   3
    Check Answer  0.5
    Close Browser

Test Substraction With Negative Result
    [Documentation]    Unwanted behaviour
    [Tags]    GUI, LOGIC
    Launch Browser
    Fill Out Form   5   7   1
    Check Answer  -2.0
    Close Browser

Test Multiplication By Zero
    [Documentation]    Unwanted behaviour
    [Tags]    GUI, LOGIC
    Launch Browser
    Fill Out Form   4   0   2
    Check Answer  0.0
    Close Browser

Test Division By Zero
    [Documentation]    Unwanted behaviour
    [Tags]    GUI, LOGIC
    Launch Browser
    Fill Out Form   4   0   3
    Check Answer  0.0
    Close Browser

Test NaN arguments
    [Documentation]    Unwanted behaviour
    [Tags]    GUI, LOGIC
    Launch Browser
    Fill Out Form   aaa   bbb   0
    Check Answer  *
    Close Browser


*** Keywords ***
Launch Browser
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window

Fill Out Form
    [Arguments]     ${VAL1}     ${VAL2}     ${OPER}
    Wait Until Element Is Visible    name:num1      5 Seconds
    Click Element   name:num1
    Input Text    name:num1     ${VAL1}
    Click Element   name:num2
    Input Text    name:num2     ${VAL2}
    Select From List By Index   operation   ${OPER}
    Click Element   id:calc_btn

Check Answer
    [Arguments]  ${ANSW}
    Element Text Should Be   css:div.alert     ${ANSW}

