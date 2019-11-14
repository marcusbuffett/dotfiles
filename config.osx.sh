# NOTE: have to take care of racer + rust src stuff

for f in ".jshintrc" ".tmux.conf" ".nvimrc" ".vimrc" ".ycm_extra_conf.py" ".ycm_extra_conf.pyc" ".zshrc" ".tmux-osx.conf" ".weechat" ".gitignore"
do
    rm ~/$f
    ln -s ~/dotfiles/$f ~/$f
done

mkdir -p ~/.config/nvim
ln -s ~/.nvimrc ~/.config/nvim/init.vim

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	sudo apt install -y fasd fzf htop ranger redis curl npm zsh
else
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

	brew link vim
fi


curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

npm install -g eslint gh how2 http-server js-beautify jshint nodemon
npm install -g spaceship-prompt

# pip3 install thefuck simpleWatch chess-cli flake8 mypy

# gem install sass

sudo mkdir -p /data/db

sudo chown 777 /data/db

echo $(which zsh) | sudo tee -a /etc/shells
sudo chsh -s $(which zsh)

curl https://pyenv.run | bash

# \curl -sSL https://get.rvm.io | bash

## TODO:
# Install diff-so-fancy
# Copy git config over
# Install marker
# Install fzf-marker
# Move .txt files from ~/.marker/ to ~/.config/marker/

 git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
