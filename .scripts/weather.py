#!/usr/bin/env python
import urllib
import requests
import sys
import json

# needs to be ne generated for every user on the owm-website
# https://openweathermap.org/api
APPID_OWM = "81aa338e6db6692568b1f23c6619c695"

# needs to be ne generated for every user on the ipstack-website
# https://ipstack.com/
APPID_IPS = "609c46cc9cd9f9ac31f28239eeeaf1d6"

# define these two identifiers correct otherwise the script could produce wrong results
DEFAULT_CITY_IDENTIFIER = "76131"
DEFAULT_COUNTRY_CODE = "DE"

def check_internet_connection():
    url='http://www.google.com/'
    timeout=5
    try:
        _ = requests.get(url, timeout=timeout)
        return True
    except requests.ConnectionError:
        return False

def get_ipv4_address():
    identme_url = "https://ident.me"

    try:
        return urllib.request.urlopen(identme_url).read().decode('utf-8')
    except (urllib.error.URLError, urllib.error.HTTPError):
        return -1


def get_location_information():
    ipstack_url = "http://api.ipstack.com/"
    format = "&format=1"

    ipv4 = get_ipv4_address()
    # the determined ipv4 adress
    # print(ipv4)

    if ipv4 == -1:
        return DEFAULT_CITY_IDENTIFIER, DEFAULT_COUNTRY_CODE

    request_url = ipstack_url + ipv4 + "?access_key=" + APPID_IPS + format
    # the url what will be requested
    # print(request_url)

    try:
        response = urllib.request.urlopen(request_url)
    except (urllib.error.URLError, urllib.error.HTTPError):
        return DEFAULT_CITY_IDENTIFIER, DEFAULT_COUNTRY_CODE

    try:
        data = json.loads(response.read().decode())
    except json.JSONDecodeError:
        return DEFAULT_CITY_IDENTIFIER, DEFAULT_COUNTRY_CODE

    return data['zip'], data['country_code']

def text_to_icon(iconName):
    weather = {
        "01d": 0xE234,
        "01n": 0xE233,
        "02d": 0xE231,
        "02n": 0xE232,
        "03d": 0xE22B,
        "03n": 0xE22B,
        "04d": 0xE22B,
        "04n": 0xE22B,
        "09d": 0xE22F,
        "09n": 0xE22F,
        "10d": 0xE230,
        "10n": 0xE230,
        "11d": 0xE22C,
        "11n": 0xE22C,
        "13d": 0xE22E,
        "13n": 0xE22E,
        "50d": 0xE235,
        "50n": 0xE235,
    }
    return chr(weather.get(iconName, ""))

def get_weather_information(city_identifier, country_code):
    try:
        int(city_identifier)
        selection = "?zip="
    except ValueError:
        selection = "?q="

    owm_url = "http://api.openweathermap.org/data/2.5/weather"
    units = "&units=metric"

    request_url = owm_url + selection + city_identifier + "," + country_code + units + "&APPID=" + APPID_OWM
    # the url that will be requested
    # print(request_url)

    try:
        response = urllib.request.urlopen(request_url)
    except (urllib.error.URLError, urllib.error.HTTPError):
        print("")
        sys.exit(-1)

    try:
        data = json.loads(response.read().decode())
    except json.JSONDecodeError:
        print("")
        sys.exit(-1)

    return text_to_icon(data['weather'][0]['icon']) + " " + str(round(data['main']['temp'])) + "°C"

if __name__ == '__main__':
    if not check_internet_connection():
        # missing internet connection
        print("")
        sys.exit(-1)

    if len(sys.argv) == 2 and sys.argv[1] == "location":
        print(get_location_information())
        sys.exit(0)

    if len(sys.argv) == 1:
        #city_identifier, country_code = get_location_information()
        city_identifier = DEFAULT_CITY_IDENTIFIER
        country_code = DEFAULT_COUNTRY_CODE
    elif len(sys.argv) == 2:
        city_identifier = sys.argv[1]
        country_code = DEFAULT_COUNTRY_CODE
    elif len(sys.argv) == 3:
        city_identifier = sys.argv[1]
        country_code = sys.argv[2] if len(sys.argv[2]) == 2 else DEFAULT_COUNTRY_CODE
    else:
        print("too many arguments given")
        sys.exit(-1)

    print(get_weather_information(city_identifier, country_code))
