#!/bin/bash

api_key=1a574cba6c46aef984b2efbe3061b147
city_id=2886242
url="api.openweathermap.org/data/2.5/weather?id=${city_id}&appid=${api_key}&lang=de "
curl ${url} -s -o ~/.cache/eleg-weather.json
