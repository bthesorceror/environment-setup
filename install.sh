#!/bin/sh

#
# Check if Homebrew is installed, install if not
#
which -s brew
if [[ $? != 0 ]] ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
else
    brew update
fi

# Install ag
echo "Installing ag from homebrew"
brew install ag

# Install Vim
echo "Installing vim from homebrew"
brew install vim

# Move existing .vimrc file
if [ -f $HOME/.vimrc ]
then
  echo "Moving old vim configuration to $HOME/.vimrc.old"
  mv $HOME/.vimrc $HOME/.vimrc.old
fi

# Copy .vimrc from github
echo "Setting up vimrc from github"
curl -s https://raw.githubusercontent.com/bthesorceror/environment-setup/master/.vimrc > $HOME/.vimrc


# Install vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
vim -c ':PlugInstall | PlugUpdate'

# Install Tmux
echo "Installing tmux from homebrew"
brew install tmux

# Move existing .tmux file
if [ -f $HOME/.tmux.conf ]
then
  echo "Moving old tmux configuration to $HOME/.tmux.conf.old"
  mv $HOME/.tmux.conf $HOME/.tmux.conf.old
fi

# Copy .tmux.conf from github
echo "Setting up tmux config from github"
curl -s https://raw.githubusercontent.com/bthesorceror/environment-setup/master/.tmux.conf > $HOME/.tmux.conf
