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


bold() {
  echo -e ${BOLD}$1${COLOR_RESET}
}

fail() {
  echo -e ${FAIL} $1
}

good() {
  echo -e ${DONE} $1
}

work() {
  echo -e ${WORK} $1
}

check_dep() {
  which $1 > /dev/null
  if [ "$?" != "0" ]
  then
    fail "You need $1 installed to continue, sucker!"
    exit 1
  else
    good "$1 is installed! Maybe there's hope for you after all!"
  fi
}

MY_TOOLS_DIR=${MY_TOOLS_DIR:-"${HOME}/Code/tools/"}
MY_ZSH="${MY_TOOLS_DIR}/zsh-config"
MY_ZSH_REMOTE="https://github.com/3rwww1/zsh-config"

bold "Hello, ${USER}!"
bold "Have you been a good n3rd and installed the required dependencies? ;)"
check_dep "git"
check_dep "zsh"

if [ ! -d "${MY_TOOLS_DIR}" ]
then
  work "Creating the tools directory..."
  mkdir -p ${MY_TOOLS_DIR}
fi

if [ ! -d "${MY_ZSH}" ]
then
  work "Cloning repository..."
  pushd ${MY_TOOLS_DIR} > /dev/null
    git clone ${MY_ZSH_REMOTE} 2>&1 | sed 's/^/    /'
  popd > /dev/null
else
  work "Pulling latest configuration..."
  pushd ${MY_ZSH} > /dev/null
    git checkout master 2>&1 | sed 's/^/    /'
    git pull ${MY_ZSH_REMOTE} 2>&1 | sed 's/^/    /'
  popd > /dev/null
fi

work "Installing..."
ln -sf ${MY_ZSH}/zshrc ${HOME}/.zshrc
ln -sf ${MY_ZSH}/zshenv ${HOME}/.zshenv
if [ "${SHELL}" == "zsh" ]
then
  source ${HOME}/.zshenv
  source ${HOME}/.zshrc
fi

good "You're all set! Come back to me if you need anything ;)"
