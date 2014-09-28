#!/bin/sh
print "This file is just for reference, the command is broken, don't execute directly"
exit 0

cp fonts/* ${HOME}/Library/Fonts

set -e
chsh -s /bin/zsh

print "Cloning OH-MY-ZSH.."

git clone git://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/custom/plugins
git clone https://github.com/facebook/xctool.git ${HOME}/.xctool/
print "[DONE]\n"



git submodule update --init --recursive

PAW=`pwd`

cd .vim/bundle/vimproc.vim && make -j4 && cd "$PAW"

ln -s .vimrc ${HOME}/.vimrc
ln -s .zshrc ${HOME}/.zshrc
ln -s .vim ${HOME}/.vim

print "Installing Pathogen..."

mkdir -p "${HOME}/.vim/autoload" && \
  curl -LSso "${HOME}/.vim/autoload/pathogen.vim" \
    "https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim"

print "[DONE]\n"

print "Installing iterm2..."

wget "https://iterm2.com/downloads/stable/iTerm2_v2_0.zip" -O "/tmp/iTerm2.zip" && \
  ditto -xk /tmp/iTerm2.zip /Applications/

print "[DONE]\n"
print "Installing rbenv and pyenv..."

git clone https://github.com/sstephenson/rbenv.git ${HOME}/.rbenv
ln -s ${HOME}/.rbenv/bin/rbenv ${HOME}/soft/bin/rbenv 
git clone https://github.com/sstephenson/ruby-build.git ${HOME}/.rbenv/plugins/ruby-build
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

print "[DONE]\n"

print "Installing iTerm2 prefs..."

plutil -convert binary1 com.googlecode.iterm2.xml.plist -o ${HOME}/Library/Preferences/com.googlecode.iterm2.plist

print "[DONE]\n"

print "TODO: Installing PLEnv"

echo "You'd need to restart your shell to use the newly configured environments.\n Todo: Java, Leiningen, and RBenv Ruby Installation"
