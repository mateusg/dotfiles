#!bin/sh

ln -sf $(pwd)/files/gemrc ~/.gemrc
ln -sf $(pwd)/files/gitconfig ~/.gitconfig
ln -sf $(pwd)/files/gitignore ~/.gitignore
ln -sf $(pwd)/files/irbrc ~/.irbrc
ln -sf $(pwd)/files/pryrc ~/.pryrc
ln -sf $(pwd)/files/rspec ~/.rspec
if [ -s "$HOME/.rvm/scripts/rvm" ]; then
  ln -sf $(pwd)/files/rvmrc ~/.rvmrc
fi
ln -sf $(pwd)/files/vimrc ~/.vimrc
ln -sf $(pwd)/files/zshrc ~/.zshrc

mkdir -p ~/.oh-my-zsh/themes/
ln -sf $(pwd)/files/.oh-my-zsh/themes/mateusg.zsh-theme ~/.oh-my-zsh/themes/mateusg.zsh-theme
