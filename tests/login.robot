*** Settings ***
Documentation   Tests for checking the login functionality and activating the mail notifications


Resource          resource.robot
Library           SeleniumLibrary
Test Teardown     Close Browser
Library           MethodsOfGmailApi.py

*** Test Cases ***
Login with google credentials and activate channel for getting email
  Open The Main Page
  Close The Modal Window
  Click The Login Link
  Click The Google Login Link
  Fill The Google Credentials
  Should Be Open Home Page
  Click The Notifications Link
  Click Activate Email Channel
  Message about Checking Email Should Be Visible
  Check That Text Input Contain Correct Email
  Sleep   10s
  ${URL_WITH_TOKEN_FOR_APPROVE_EMAIL_CHANNEL}     Call The Url With For Approve Email
  Go To  ${URL_WITH_TOKEN_FOR_APPROVE_EMAIL_CHANNEL}
  Check That Page After Sucess Activating
  Click The Notifications Link
  Pause And Delete Links For Email Channel Visible
