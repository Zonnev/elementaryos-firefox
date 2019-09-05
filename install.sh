#!/bin/bash

cd ~/.mozilla/firefox/

if [[ $(grep '\[Profile[^0]\]' profiles.ini) ]]
    then PROFPATH=$(grep -E '^\[Profile|^Path|^Default' profiles.ini | grep -1 '^Default=1' | grep '^Path' | cut -c6-)
    else PROFPATH=$(grep 'Path=' profiles.ini | sed 's/^Path=//')
fi


URLPATH=https://raw.githubusercontent.com/Zonnev/elementaryos-firefox-theme/master/userChrome.css
THEMEPATH="/home/$USER/.mozilla/firefox/$PROFPATH/chrome/userChrome.css"

mkdir -p "$(dirname "$THEMEPATH")" && touch "$FILE"
curl -K -O $URLPATH >> $THEMEPATH
