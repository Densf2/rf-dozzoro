*** Settings ***
Documentation     A resource file with reusable keywords and variables
...               related to the homepage, settings page, notifications
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${VALID USER}     tests12imple@gmail.com
${VALID PASSWORD}    Qwerty+1
${MAIN URL}      https://dev.dozorro.work


*** Keywords ***
Open The Main Page
    Open Browser    ${MAIN URL}    ${BROWSER}
    Maximize Browser Window

Close The Modal Window
    Wait Until Element Is Visible     css=#review_form3 header
    Element Text Should Be  css=#review_form3 header > p    Друзі, доброго дня!
    Click Element   css=#review_form3 header > a.delete

Click The Login Link
    Click Element    css=div.login_link a

Click The Google Login Link
    Click Link    css=a.btn-google

Fill The Google Credentials
    Wait Until Element Is Visible   css=input[type="email"]
    Input Text      css=input[type="email"]   ${VALID USER}
    Click Element    css=#identifierNext > span
    Wait Until Element Is Visible   css=input[type="password"
    Input Text      css=input[type="password"]    ${VALID PASSWORD}
    Click Element   css=#passwordNext > span > span

Should Be Open Home Page
    Wait Until Element Is Visible   css=div.block_info_foto_home
    Element Text Should Be    css=h2    Громадський контроль держзакупівель

Click The Notifications Link
    Element Should Be Visible   css=span.name
    Click Element   css=span.caret
    Click Link    Сповіщення
    Click Link    Налаштування
    Location Should Be    https://dev.dozorro.work/user/settings

Click Activate Email Channel
    Click Element   css=span.is-outlined-button

Message About Checking Email Should Be Visible
    Wait Until Page Contains    Перевірте пошту  timeout=10s
    Element Text Should Be    css=tr:nth-child(1) > td:nth-child(3) > span    Перевірте пошту

Check That Text Input Contain Correct Email
    ${email_from_portal}  Get Text    css=.settings-info.active span
    Should Be Equal   ${email_from_portal}   ${VALID USER}

Check That Page After Sucess Activating
    Location Should Be    https://dev.dozorro.work/notify/info/ok
    Element Should Be Visible   css=h1
    Element Text Should Be    css=h1    КАНАЛ АКТИВОВАНО УСПІШНО

Pause And Delete Links For Email Channel Visible
    Element Should Be Visible   css=i.icon-pause
    Element Should Be Visible   css=i.icon-remove
