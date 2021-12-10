#!/bin/bash
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 6`
RESET=`tput sgr0`

echo -e
echo -e
echo -e
echo -e
echo "██████╗  █████╗ ██████╗ ██╗    ███╗   ███╗███████╗██╗  ██╗██████╗ ██╗███████╗███████╗"
echo "██╔══██╗██╔══██╗██╔══██╗██║    ████╗ ████║██╔════╝██║  ██║██╔══██╗██║╚════██║╚════██║"
echo "██████╔╝███████║██████╔╝██║    ██╔████╔██║█████╗  ███████║██║  ██║██║   ██╔╝    ██╔╝"
echo "██╔══██╗██╔══██║██╔══██╗██║    ██║╚██╔╝██║██╔══╝  ██╔══██║██║  ██║██║  ██╔╝    ██╔╝"
echo "██████╔╝██║  ██║██║  ██║██║    ██║ ╚═╝ ██║███████╗██║  ██║██████╔╝██║  ██║     ██║"
echo "╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝     ╚═╝"
echo "${BLUE}--------------------------|Welcome to My script installer|---------------------------${RESET}"
echo -e
echo -e
echo -e
echo -e

read -p "${GREEN}Do you want to ${RED}Update Your System?${GREEN}:${YELLOW} [y/N]${RESET}" update
read -p "${GREEN}Do you want to ${RED}Install git?${GREEN}:${YELLOW} [y/N]${RESET}" git
read -p "${GREEN}Do you want to ${RED}Install openssl?${GREEN}:${YELLOW} [y/N]${RESET}" os
read -p "${GREEN}Do you want to ${RED}Install curl?${GREEN}:${YELLOW} [y/N]${RESET}" curl
read -p "${GREEN}Do you want to ${RED}Install lsb-release?${GREEN}:${YELLOW} [y/N]${RESET}" lsb
read -p "${GREEN}Do you want to ${RED}Install Docker?${GREEN}:${YELLOW} [y/N]${RESET}" docker
read -p "${GREEN}Do you want to Make docker run Without ${RED}sudo${GREEN}:${YELLOW} [y/N]${RESET}" dsudo
read -p "${GREEN}Do you want to ${RED}Install Docker Compose?${GREEN}:${YELLOW} [y/N]${RESET}" dc

echo -e
echo -e
echo -e
echo -e
echo "${RED}------------|Thank You, Pleas wait....|------------${RESET}"
echo -e
echo -e
echo -e
echo -e
# sleep 2

if [ $update = 'y' ]
then
  echo "${RED}Updating The System${RESET}"
  # sudo apt-get update -y
fi
if [ $os = 'y' ]
then
  if ! [ -x "$(command -v ssh)" ]
  then
      echo "${GREEN}Installing ${BLUE}openssh${RESET}"
      # sudo apt install openssh-server -y
  else
    echo "${BLUE}openssh${RED} is Installed${RESET}"
  fi
fi
if [ $git = 'y' ]
then
  if ! [ -x "$(command -v git)" ]
  then
    echo "${RED}Installing ${BLUE}git${RESET}"
    # sudo apt install git -y
  else
    echo "${BLUE}git${RED} is Installed${RESET}"
  fi
fi
if [ $curl = 'y' ]
then
  if ! [ -x "$(command -v curl)" ]
  then
    echo "${RED}Installing ${BLUE}curl${RED}, ${BLUE}ca-certificates${RED} and ${BLUE}gnupg${RESET}"
    # sudo apt-get install ca-certificates curl gnupg lsb-release -y
  else
    echo "${BLUE}curl${RED} is Installed${RESET}"
  fi
fi
if [ $curl = 'y' ]
then
  if ! [ -x "$(command -v lsb_release)" ]
  then
    echo "${RED}Installing ${BLUE}lsb-release${RESET}"
    # sudo apt-get install lsb-release -y
  else
    echo "${BLUE}lsb_release${RED} is Installed${RESET}"
  fi
fi
if [ $docker = 'y' ]
then
  if ! [ -x "$(command -v docker)" ]
  then
    echo "${RED}Adding ${BLUE}Docker${RED}’s official ${BLUE}GPG key${RESET}"
    # curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "${RED}setting up the stable repository${RESET}"
    # echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    #   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    echo "${RED}Re-update The System${RESET}"
    # sudo apt-get update -y
    echo "${RED}Installing ${BLUE}docker${RESET}"
    # sudo apt-get install docker-ce docker-ce-cli containerd.io -y
    else
      echo "${BLUE}docker${RED} is Installed${RESET}"
    fi
fi
if [ $dsudo = 'y' ]
then
  echo "${RED}Make docker run as${BLUE} root${RESET}"
  # sudo groupadd docker
  # sudo usermod -aG docker $USER
  # sudo service docker restart
fi
if [ $dc = 'y' ]
then
  if ! [ -x "$(command -v docker-compose)" ]
  then
    echo "${RED}Downloading the current stable release of Docker Compose${RESET}"
    # sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    echo "${RED}Apply executable permissions to the binary${RESET}"
    # sudo chmod +x /usr/local/bin/docker-compose
  else
    echo "${BLUE}docker-compose${RED} is Installed${RESET}"
  fi
fi
