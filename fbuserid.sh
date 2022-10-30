#!/bin/bash
#
# FBUserID: Open Source
# License: General Public License
# System: GNU/linux
# Date: 01-11-2022
#
# YouTube: https://youtube.com/channel/UCfMjNcFvJae_9g7wQI2W7EA
# Facebook: https://www.facebook.com/whitehacks00
# TikTok: https://tiktok.com/@whitehacks00
# Telegram: https://t.me/whitehacks00
# GitHub: https://github.com/Darkmux
#
# This tool was created in honor of @thelinuxchoice.
#
# ==============================================
#                   Variables
# ==============================================
operatingSystem=$(uname -o)
deviceArchitecture=$(uname -m)
showPath=$(pwd)
link=$1
save=$2
# ==============================================
#                  Light colors
# ==============================================
black="\e[1;30m"
blue="\e[1;34m"
green="\e[1;32m"
cyan="\e[1;36m"
red="\e[1;31m"
purple="\e[1;35m"
yellow="\e[1;33m"
white="\e[1;37m"
# ==============================================
#                  Dark colors
# ==============================================
blackDark="\e[0;30m"
blueDark="\e[0;34m"
greenDark="\e[0;32m"
cyanDark="\e[0;36m"
redDark="\e[0;31m"
purpleDark="\e[0;35m"
yellowDark="\e[0;33m"
whiteDark="\e[0;37m"
# ==============================================
#               Background colors
# ==============================================
blackBack=$(setterm -background black)
blueBack=$(setterm -background blue)
greenBack=$(setterm -background green)
cyanBack=$(setterm -background cyan)
redBack=$(setterm -background red)
yellowBack=$(setterm -background yellow)
whiteBack=$(setterm -background white)
# ==============================================
#                Banner FBUserID
# ==============================================
function fbuserid() {
    sleep 0.5
    clear
    cat fbuserid.txt
    echo -e ${white}"
               [ FB.USER.ID ]${black}
              Facebook User ID
             Coded by: ${red}@Darkmux"${white}
}
# ==============================================
#                  Enter Input
# ==============================================
function repeat() {
    echo -e "    ${whiteBack}          ${blue}Press Enter to Continue!          ${blackBack}${white}"
    read
    option
}
# ==============================================
#                  Interactive
# ==============================================
function option() {
    fbuserid
    echo -e -n ${black}"
    ${whiteBack} Enter a Number and Choose an Option ${blackBack}${white}

    ${blue}01 ${white}UserID   ${black}Get ID of a facebook profile
    ${blue}02 ${white}Logout   ${black}Log out of facebook with link
    ${blue}03 ${white}Request  ${black}View sent friend requests
    ${blue}04 ${white}Search   ${black}Search facebook account
    ${blue}05 ${white}Short    ${black}Short URL with facebook

    ${blue}> ${white}choose: ${blue}"
    read -r option
    sleep 0.5

    if [[ "${option}" == "exit" || "${option}" == "EXIT" ]]; then
        exit
    elif [[ "${option}" == "0" || "${option}" == "00" ]]; then
        exit
    elif [[ "${option}" == "1" || "${option}" == "01" ]]; then
        echo -e -n "    ${blue}> ${white}profile: "${blue}
        read -r link
        echo -e ${white}"    --------------------------------------------"
        echo "${link}" > link.txt
        id=$(cut -d "/" -f 4 link.txt)
        get="https://m.facebook.com/${id}"
        curl -s ${get} > get.txt
        res=$(cut -d ">" -f 5 get.txt | cut -d "|" -f 1)
        echo -e "${res}" > name.txt
        name=$(tail -n 1 name.txt)
        rm name.txt
        idnum=$(grep -o "profile.php" link.txt)
        if [[ "${idnum}" == "profile.php" ]]; then
            id=$(cut -d "=" -f 2 link.txt)
        else
            id=$(cut -d "/" -f 4 link.txt)
        fi
        rm link.txt
        echo -e ${blue}"    NAME: ${white}${name}${blue}
    ID: ${white}${id}"
        rm get.txt
        echo -e ${white}"    --------------------------------------------"
        repeat
    elif [[ "${option}" == "2" || "${option}" == "02" ]]; then
        echo -e ${white}"    --------------------------------------------"
        echo -e ${blue}"    Send to target: ${white}https://m.facebook.com/logout.php?h=AffVApbMfW672Eu2v6o&t=1609210026&source=mtouch_logout_button&persist_locale=1&button_name=logout&button_location=settings"
        echo -e ${white}"    --------------------------------------------"
        repeat
    elif [[ "${option}" == "3" || "${option}" == "03" ]]; then
        echo -e ${white}"    --------------------------------------------"
        echo -e ${blue}"    Open link: ${white}https://m.facebook.com/friends/center/requests/outgoing"
        termux-open-url "https://m.facebook.com/friends/center/requests/outgoing"
        echo -e ${white}"    --------------------------------------------"
        repeat
    elif [[ "${option}" == "4" || "${option}" == "04" ]]; then
        echo -e ${white}"    --------------------------------------------"
        echo -e ${blue}"    Open link: ${white}https://m.facebook.com/login/identify/?ctx=recover&c=https%3A%2F%2Fm.facebook.com%2F&multiple_results=0&ars=facebook_login&from_login_screen=0&lwv=100&_rdr"
        termux-open-url "https://m.facebook.com/login/identify/?ctx=recover&c=https%3A%2F%2Fm.facebook.com%2F&multiple_results=0&ars=facebook_login&from_login_screen=0&lwv=100&_rdr"
        echo -e ${white}"    --------------------------------------------"
        repeat
    elif [[ "${option}" == "5" || "${option}" == "05" ]]; then
        echo -e -n ${blue}"    > ${white}link: "${blue}
        read -r link
        echo -e ${white}"    --------------------------------------------"
        sleep 0.5
        fb="https://www.facebook.com/l/4AQC6gcT_"
        echo "${link}" > link.txt
        first="https://"
        second="/"
        sed -i "s!${first}!${second}!g" link.txt
        domain=$(tail -n 1 link.txt)
        link="${fb}${domain}"
        echo -e ${blue}"    short: ${white}${link}"
        rm link.txt
        echo -e ${white}"    --------------------------------------------"
        repeat
    else
        echo -e ${red}"    [!] ${white}Invalid Option"
        sleep 0.5
        option
    fi
}
# ==============================================
#              Declaring functions
# ==============================================
option
# ==============================================
#    Created by: @Darkmux - WHITE HACKS ©2023
# ==============================================
