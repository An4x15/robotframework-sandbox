*** Settings ***
Library           SeleniumLibrary    # SeleniumLib

*** Variables ***
${Username}       testuser@geeksyndicate.info
${Password}       qwerAa11
${Browser}        gc
${SiteUrl}        https://calendar.google.com/
${DashboardTitle}    -
${Delay}          2s

*** Test Cases ***
LoginTest
    Open Browser to the Login Page
    Enter User Name
    Click NextUID
    sleep    ${Delay}
    Enter Password
    Click NextPw
    sleep    ${Delay}
    Is page loaded
    [Teardown]    Close Browser

ImportCsvTest
    Open Browser to the Login Page
    Enter User Name
    Click NextUID
    sleep    ${Delay}
    Enter Password
    Click NextPw
    sleep    ${Delay}
    Is page loaded
    sleep    ${Delay}
    Unselect Frame
    selectFrame
    addCalendar
    clickImport
    [Teardown]    Close Browser

*** Keywords ***
Click NextPw
    Click Element    //div[@id='passwordNext']

Click NextPwPW
    Click Element    //div[@id='passwordNext']
    Click Element    //div[@id='passwordNext']

Click NextUID
    Click Element    //div[@id='identifierNext']

Enter Password
    Input Text    //input[@name='password']    ${Password}

Enter User Name
    Input Text    //input[@id='identifierId']    ${Username}

Is page loaded
    Element Should Be Visible    //a[@class='gb_x']

Open Browser to the Login Page
    open browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window

addCalendar
    Click Element    //div[@class='U26fgb JRtysb WzwrXb I12f0b K2mXPb oFBMuc']

clickImport
    Click Element    //DIV[@class='jO7h3c'][text()='Importálás']

selectFrame
    SeleniumLibrary.Select Frame    apiproxy3e2813cfcfffd2e8b19b70ebb2e7332a4f09990b0.1889077214
