#!/bin/bash

# Command for running this bash script (hosted)
# curl -s -N 'https://hackmit.org/warp_theme_installer.sh' | bash
# Command for running this bash script (local), also please 
# ensure you've added execute permissions! (chmod +x ./warp_theme_installer.sh):
# ./warp_theme_installer.sh

# Theme Configuration
readonly THEME_NAME="hack_mit_2024"
readonly THEME_CONTENT='
# HackMIT 2024 Warp Theme
#
# Exclusive theme for HackMIT attendees. 
# Please see documentation for Warp themes at:
# https://docs.warp.dev/features/themes
# You can find more themes at:
# https://github.com/warpdotdev/themes
#
# Credits for design assets go to the HackMIT 2024 team (https://hackmit.org/).

---
background: "#0a1228"
accent: "#e754ac"
foreground: "#fffcf0"
background_image:
  path: "hack_mit_2024_warp_bg.png"
  opacity: 45
details: darker
terminal_colors:
  normal:
    black: "#444444"
    red: "#ff5555"
    green: "#c5f467"
    yellow: "#fdde7b"
    blue: "#bd93f9"
    magenta: "#ff79c6"
    cyan: "#5cecc6"
    white: "#c5d1eb"
  bright:
    black: "#8e8e8e"
    red: "#ff7777"
    green: "#c1f080"
    yellow: "#ffda8a"
    blue: "#caa9fa"
    magenta: "#ff79c6"
    cyan: "#7be9dd"
    white: "#dfe5ee"
name: "HackMIT 2024"
'
# Warp Variables
readonly WARP_THEME_DIR="$HOME/.warp/themes"
# Colors
readonly RESET="\033[0m"
readonly BLACK="\033[0;30m"
readonly BOLD="\033[1m"
readonly DIM="\033[2m"
readonly GREEN_BOLD="\033[1;32m"
readonly RED_BOLD="\033[1;31m"
readonly BACKGROUND_LIGHT_GREEN="\033[102m"
readonly BACKGROUND_LIGHT_RED="\033[101m"
# HackMIT background image
readonly HACK_MIT_IMAGE_NAME="hack_mit_2024_warp_bg.png"
readonly HACK_MIT_IMAGE_PATH="https://github.com/liliwilson/hackmit-warp-theme/blob/39eb85a5a058a72fbc9906ca9e74e6c1ee9a6a43/hack_mit_2024_warp_bg.png?raw=true"
curl -L "${HACK_MIT_IMAGE_PATH}" --output "${WARP_THEME_DIR}/${HACK_MIT_IMAGE_NAME}"
printf "${GREEN_BOLD}✓${RESET} ${BOLD}Installing theme:${RESET}${DIM} ${THEME_NAME}${RESET}\n"
# Check if WARP_THEME_DIR exists
if [ ! -d "${WARP_THEME_DIR}" ]; then
	printf "${GREEN_BOLD}✓${RESET} ${BOLD}Creating Warp Theme Directory:${RESET}${DIM} ${WARP_THEME_DIR}${RESET}\n"
	mkdir -p "${WARP_THEME_DIR}"
fi
# Check if theme file already exists
if [ -f "${WARP_THEME_DIR}/${THEME_NAME}.yaml" ]; then
	printf "${RED_BOLD}✗${RESET} ${BOLD}Theme already exists:${RESET} ${DIM}${WARP_THEME_DIR}/${THEME_NAME}.yaml\n\n"
	printf "${BLACK}${BACKGROUND_LIGHT_RED} Next steps ${RESET}\n\n"
	printf "Delete the file to continue\n"
	printf "Copy and paste ${DIM}rm ${WARP_THEME_DIR}/${THEME_NAME}.yaml ${RESET}into your terminal\n" 
	exit 1
fi
touch "${WARP_THEME_DIR}/${THEME_NAME}.yaml"
echo "${THEME_CONTENT}" > "${WARP_THEME_DIR}/${THEME_NAME}.yaml"	
printf "${GREEN_BOLD}✓${RESET} ${GREEN}Successfully installed the HackMIT 2024 theme!\n\n"
printf "${BLACK}${BACKGROUND_LIGHT_GREEN} Next steps ${RESET}\n\n"
printf "You can now select the ${GREEN_BOLD}HackMIT 2024 ${RESET} theme from the Theme Picker\n\n"
printf "Don't know how to open the Theme Picker? ${GREEN_BOLD}https://docs.warp.dev/features/themes#how-to-access-it${RESET}\n"
printf "${DIM}Enjoy your new theme!${RESET}\n"
