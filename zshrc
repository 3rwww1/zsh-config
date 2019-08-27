source /usr/share/zsh/share/antigen.zsh
source =virtualenvwrapper.sh

antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv

# Load the theme.
antigen theme 3rwww1/oh-my-zsh-powerline-theme

# Tell Antigen that you're done.
antigen apply
source /usr/share/nvm/init-nvm.sh
