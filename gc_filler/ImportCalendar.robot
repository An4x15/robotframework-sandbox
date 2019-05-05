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
    addCalendar
    sleep    ${Delay}
    clickImport
    sleep    ${Delay}
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
    Set Focus To Element    //div[@class='U26fgb JRtysb WzwrXb I12f0b K2mXPb oFBMuc']
    Sleep    ${Delay}
    Click Element    //div[@class='NcbWHe']

clickImport
    Element Should Be Visible    //DIV[@class='jO7h3c'][text()='Importálás']
    Set Focus To Element    //DIV[@class='jO7h3c'][text()='Importálás']
    Click Element    //DIV[@class='jO7h3c'][text()='Importálás']
