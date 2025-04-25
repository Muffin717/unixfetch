#!/bin/bash

echo " "

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
RESET='\033[0m'

# System info
get_os() {
    [[ -f /etc/os-release ]] && . /etc/os-release && echo "$NAME" || echo "Unknown OS"
}

get_hostname() {
    hostname
}

get_uptime() {
    uptime -p
}

get_cpu() {
    [[ -f /proc/cpuinfo ]] && grep -m 1 'model name' /proc/cpuinfo | cut -d ':' -f2 | xargs || echo "Unknown CPU"
}

get_memory() {
    free -h | awk '/^Mem:/ {print $3 "/" $2}'
}

# Fetch OS name
OS_NAME=$(get_os)

# ASCII Distro logos
case "$OS_NAME" in
    "Ubuntu"*)
        logo_lines=(
        "       ..;,; .,;,."
        "    .,lool: .ooooo,"
        "   ;oo;:    .coool."
        " ....         ''' ,l;"
        ":oooo,            'oo."
        "looooc            :oo'"
        " '::'             ,oo:"
        "   ,.,       .... co,"
        "    lo:;.   :oooo; ."
        "     ':ooo; cooooc"
        "        '''  ''''"
        )
        ;;
    "EndeavourOS"*)
        logo_lines=(
        "          /o."
        "        /sssso-"
        "      /ossssssso:"
        "    /ssssssssssso+"
        "  /ssssssssssssssso+"
        "//osssssssssssssso+-"
        " \`+++++++++++++++-\`"
        )
        ;;
    "Arch Linux"*)
        logo_lines=(
        "      /\\"
        "     /  \\"
        "    /    \\"
        "   /      \\"
        "  /   ,,   \\"
        " /   |  |   \\"
        "/_-''    ''-_\\"
        )
        ;;
    "Debian GNU/Linux"*)
        logo_lines=(
        "  _____"
        " /  __ \\"
        "|  /    |"
        "|  \\___-"
        "-_"
        "  --_"
        )
        ;;
    "Linux Mint"*)
        logo_lines=(
        " __________"
        "|_          \\"
        "  | | _____ |"
        "  | | | | | |"
        "  | | | | | |"
        "  | \\_____/ |"
        "  \\_________/"
        )
        ;;
    "MX"*)
        logo_lines=(
        "    \\\\  /"
        "     \\\\/"
        "      \\\\"
        "   /\\/ \\\\"
        "  /  \\  /\\"
        " /    \\/  \\"
        "/__________\\"
        )
        ;;
    "Fedora Linux"*)
        logo_lines=(
        "        ,'''''."
        "       |   ,.  |"
        "       |  |  '_'"
        "  ,....|  |.."
        ".'  ,_;|   ..'"
        "|  |   |  |"
        "|  ',_,'  |"
        " '.     ,'"
        "   '''''"
        )
        ;;
    "Manjaro Linux"*)
        logo_lines=(
        "||||||||| ||||"
        "||||||||| ||||"
        "||||      ||||"
        "|||| |||| ||||"
        "|||| |||| ||||"
        "|||| |||| ||||"
        "|||| |||| ||||"
        )
        ;;
    "openSUSE Leap"*)
        logo_lines=(
        "  _______"
        "__|   __ \\"
        "     / .\\ \\"
        "     \\__/ |"
        "   _______|"
        "   \\_______"
        "__________/ "
        )
        ;;
    "CentOS Linux"*)
        logo_lines=(
        " ____^____"
        " |\\  |  /|"
        " | \\ | / |"
        "<---- ---->"
        " | / | \\ |"
        " |/__|__\\|"
        "     v"
        )
        ;;
    "Pop!_OS"*)
        logo_lines=(
        "______"
        "\\   _ \\        __"
        " \\ \\ \\ \\      / /"
        "  \\ \\_\\ \\    / /"
        "   \\  ___\\  /_/"
        "    \\ \\"
        "   __\\_\\__(_)_" 
        "  (___________)\`"
        )
        ;;
    "CachyOS"*)
        logo_lines=(
        "   /''''''''''''/"
        "  /''''''''''''/"
        " /''''''/"
        "/''''''/"
        "\\......\\"
        " \\......\\"
        "  \\.............../"
        "   \\............./"
        )
        ;;
    "Void"*)
        logo_lines=(
        "    ____"
        "  'pfPfp.%"
        "//  _._  \\\\"
        "UU |===| UU"
        "\\\\  ^~^  //"
        " \`0PpppP'"
        "   \`\`\`\`\`"
        )
        ;;
    "Vanilla"*)
        logo_lines=(
        "      ,x."
        "     ;&?^."
        ".-e~^+7'  )adbx,"
        " \\#\\.  \`,*~ ~*/"
        "  \`~*+-'-<ay,^"
        "  ,/  ,%\\ \`\\&,"
        "  !&UP*  +./%?"
        )
        ;;
    *)
        logo_lines=(
        "Hello :3"
        )
        ;;
esac

# Info Lines
info_lines=(
" "
"${CYAN}OS:        ${WHITE}${OS_NAME}"
"${CYAN}Hostname:  ${WHITE}$(get_hostname)"
"${CYAN}Uptime:    ${WHITE}$(get_uptime)"
"${CYAN}CPU:       ${WHITE}$(get_cpu)"
"${CYAN}Memory:    ${WHITE}$(get_memory)"
)

for i in "${!logo_lines[@]}"; do
    printf "%-20s" "${logo_lines[i]}"
    if [[ $i -lt ${#info_lines[@]} ]]; then
        echo -e "  ${info_lines[i]}"
    else
        echo ""
    fi
done
echo -e "${RESET}"
