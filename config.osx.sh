# NOTE: have to take care of racer + rust src stuff

for f in ".jshintrc" ".tmux.conf" ".nvimrc" ".vimrc" ".ycm_extra_conf.py" ".ycm_extra_conf.pyc" ".zshrc" ".tmux-osx.conf" ".weechat" ".gitignore"
do
    rm ~/$f
    ln -s ~/dotfiles/$f ~/$f
done

mkdir -p ~/.config/nvim
ln -s ~/.vim ~/.config/nvim/init.vim

mkdir -p ~/antigen
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/antigen/antigen.zsh
source ~/antigen/antigen.zsh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

while [ 1 ]
do
  if xcode-select -p &> /dev/null; then
    break
  else
    sleep 5
  fi
done

# java must be installed to install gradle (one of the brew packages)
brew cask install java
cat ./brew_packages | xargs brew install

brew install grep --with-default-names

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

brew link vim

npm install -g bower grunt-cli babel eslint gh grunt gulp how2 http-server js-beautify jshint nodemon mocha uglify
npm install -g spaceship-prompt

pip3 install thefuck simpleWatch chess-cli flake8 mypy

gem install sass

sudo mkdir -p /data/db

sudo chown 777 /data/db

echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

\curl -sSL https://get.rvm.io | bash

## TODO:
# Install diff-so-fancy
# Copy git config over
# Install marker
# Install fzf-marker
# Move .txt files from ~/.marker/ to ~/.config/marker/
