#!/bin/bash
set -e

COLOR_RESET="\e[00m"
COLOR_GREEN="\e[32m"
COLOR_RED="\e[31m"
COLOR_BLUE="\e[34m"
BOLD="\e[1m"
DONE="${BOLD}${COLOR_GREEN}✓${COLOR_RESET}"
FAIL="${BOLD}${COLOR_RED}✗${COLOR_RESET}"
WORK="${BOLD}${COLOR_BLUE}⥁${COLOR_RESET}"

MY_ZSH_INSTALL_DIR=${MY_ZSH_INSTALL_DIR:-"${HOME}/Code/tools/"}
MY_ZSH="${MY_ZSH_INSTALL_DIR}/zsh-config"

MY_ZSH_REMOTE="https://github.com/3rwww1/zsh-config"

echo "${BOLD}Welcome back, Erwan !${COLOR_RESET}"
echo "${BOLD}Have you been a good boy and installed the correct dependencies ;) ?${COLOR_RESET}"

which git > /dev/null
if [ "$?" != "0" ]
then
  echo "${FAIL} You need git installed to continue, sucker!"
  exit 1
else
  echo "${DONE} git is installed! Maybe there's hope for you after all!"
fi

which zsh > /dev/null
if [ "$?" != "0" ]
then
  echo "${FAIL} You need zsh installed to continue, sucker!"
  exit 1
else
  echo "${DONE} zsh is installed! Maybe there's hope for you after all!"
fi

if [ ! -d "${MY_ZSH_INSTALL_DIR}" ]
then
  echo "${WORK} Creating the installation directory"
  mkdir -p ${MY_ZSH_INSTALL_DIR}
  git clone ${MY_ZSH_REMOTE}
else
  echo "${WORK} Pulling latest configuration..."
  pushd ${MY_ZSH}
  git pull ${MY_ZSH_REMOTE}
  popd
fi

pushd ${MY_ZSH}
  ln -sf zshrc ~/.zshrc
  ln -sf zshenv ~/.zshenv
  exec zsh
popd

echo "${DONE} You're all set! Come back to me if you need anything ;)"

