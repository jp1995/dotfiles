#!/bin/bash


### API Information ###
# This script uses the Dark Sky weather API. You will need to register an account to get an API key.

# The first 1000 API requests you make every day are free of charge.
# Currently updating every 120 seconds (defined in polybar settings), amounting to 720 API calls/day

# Documentation overview: https://darksky.net/dev/docs
# Account overview: https://darksky.net/dev/account

# Define your location. api.darksky.net/forecast/api_key/latitude,longitude?... If you want Fahrenheit, use units=us
address="https://api.darksky.net/forecast/INSERT_API_KEY_HERE/59.433335,24.750486?units=si&exclude=minutely,hourly,daily,alerts,flags"
weather="$(wget -q -O- $address)"

# Look for the current weather conditions
[[ "$weather" =~ \"icon\":\"([^\"]*)\" ]]
condition="${BASH_REMATCH[1]}"

# Look for the current apparent temperature. Use \"temperature\", if you like.
[[ "$weather" =~ \"apparentTemperature\":([^,]*), ]]
temperature="${BASH_REMATCH[1]}"

# Print some spacing, and a cloud icon. If you can't see the icon, install otf-font-awesome-4 from the AUR or find it for your distribution
printf "\040"

# Print a rounded temperature value
LC_ALL=C /usr/bin/printf '%.0f' " $temperature"

# Use either Celsius or Fahrenheit character
if grep -qi 'units=us' <<< $address; then
	printf "°F"
else
	printf "°C"
fi

# Print edgy shit about the weather
if grep -qi 'rain' <<< $condition; then
    printf " It's raining!"
elif grep -qi 'partly-cloudy' <<< $condition; then
    printf " Kinda grey"
elif grep -qi 'cloudy' <<< $condition; then
    printf " Shit weather"
elif grep -qi 'clear-day' <<< $condition; then
    printf " It's a super nice day today wooow!"
elif grep -qi 'clear-night' <<< $condition; then
	printf " Look up at the stars."
elif grep -qi 'snow' <<< $condition; then
	printf " It's snowing!"
elif grep -qi 'fog' <<< $condition; then
	printf " Spooky fog"
elif grep -qi 'wind' <<< $condition; then
	printf " Don't fly away"
elif grep -qi 'sleet' <<< $condition; then
	printf " Sleet. Stay inside"
# Next 3 may not be defined yet according to documentation
elif grep -qi 'thunderstorm' <<< $condition; then
	printf " THUNDARRRRR"
elif grep -qi 'hail' <<< $condition; then
	printf " go outside for brain damage"
elif grep -qi 'tornado' <<< $condition; then
	printf " Tornado. Stay inside. Or don't. You'll probably never see this text. Basement? Be careful."
else
    printf " idk kev just look out the window"
fi




# Powered by Dark Sky. See more: https://darksky.net/poweredby/
