

import requests
from requests.exceptions import HTTPError
import json

bearer = 'Bearer '

def call_the_url_with_for_approve_email():
    """Get Message with given ID.
       Return the url for activating channel
    """
    id_of_the_message = get_the_latest_message_in_mailbox()

    url = "https://www.googleapis.com/gmail/v1/users/tests12imple@gmail.com/messages/%s?key=AIzaSyAp0LLQQgiC4GDO-GT72l7jRjbSTuuGQgQ HTTP/1.1"% id_of_the_message

    acess_token = bearer + get_the_access_token()

    payload = {}
    headers = {
      'Accept': 'application/json',
      'Authorization': acess_token
    }

    try:
        response = requests.request("GET", url, headers=headers, data = payload)
        response.raise_for_status()
    except HTTPError as http_err:
        print(f'Http error: {http_err}')
    except Exceptions as err:
        print(f'Other errors: {err}')
    else:
        print('Success')
        return response.json()['snippet'][85:]


def get_the_latest_message_in_mailbox():
    """Get the list of messages inside the mail box.
       Return the id of message.
    """
    url = "https://www.googleapis.com/gmail/v1/users/tests12imple@gmail.com/messages?key=AIzaSyAp0LLQQgiC4GDO-GT72l7jRjbSTuuGQgQ HTTP/1.1"

    acess_token = bearer + get_the_access_token()
    payload = {}
    headers = {
      'Accept': 'application/json',
      'Authorization': acess_token
    }

    response = requests.request("GET", url, headers=headers, data = payload)

    return response.json()['messages'][0]['id']


def get_the_access_token():
    """Update the access token based on the refresh token
    """
    url = "https://accounts.google.com/o/oauth2/token?client_id=1621068929-a5khd7miv0dk2klk72m8sfau29866he1.apps.googleusercontent.com&client_secret=Lew_Yxs_zbhQhfRyGsrqSDQB&refresh_token=1//0cXyjQHK1BLvJCgYIARAAGAwSNwF-L9Irm6P-KmdM1fGMwLFlpuoIbhx0wxmQWj4XY-2unegOxHTBmgQ7AoWJFaUcPtdGi2x_4yY&grant_type=refresh_token"

    payload = {}
    headers = {

    }

    response = requests.request("POST", url, headers=headers, data = payload)

    return response.json()['access_token']
