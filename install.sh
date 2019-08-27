#!/bin/en sh

mv .zshrc ~/.zshrc


echo "Welcome back, Erwan !"
echo "Have you been a good boy and installed the correct dependencies ;) ?"

which git > /dev/null
if [ "$?" != "0" ]
then
  echo "SUCKER! You need git installed to continue!"
  exit 1
else
  echo "-> git is installed! Maybe there's hope for you after all!"
fi

which zsh > /dev/null
if [ "$?" != "0" ]
then
  echo "SUCKER! You need zsh installed to continue!"
  exit 1
else
  echo "-> zsh is installed! Maybe there's hope for you after all!"
fi

ZSH_CONFIG_ROOT_DIR=${ZSH_CONFIG_ROOT_DIR:-"/tmp/"}

if [ ! -d "${ZSH_CONFIG_ROOT_DIR}" ]
then
  echo "SUCKER! Your INSTALLDIR environment variable points to void"
  exit 1
fi

pushd ${INSTALLDIR}
  git clone https://github.com/3rwww1/zsh-config
  cp zsh-config/zshrc ~/.zshrc
popd

echo "You're all set! Come back to me if you need anything ;)"

