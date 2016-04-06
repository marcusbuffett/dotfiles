for f in ".jshintrc" ".tmux.conf" ".nvimrc" ".vimrc" ".ycm_extra_conf.py" ".ycm_extra_conf.pyc" ".zshrc" ".tmux-osx.conf" ".weechat" ".gitignore"
do
    rm ~/$f
    ln -s ~/dotfiles/$f ~/$f
done

mkdir -p ~/.config/nvim
ln -s ~/.vim ~/.nvim

curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > antigen.zsh
source antigen.zsh
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

cat ./brew_packages | xargs brew install

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# ST
# brew install imagemagick libav phantomjs libtiff

brew link vim

npm install -g bower grunt-cli babel eslint gh grunt gulp how2 http-server js-beautify jshint nodemon mocha uglify

pip install thefuck simplewatch chess-cli

gem install sass

sudo mkdir -p /data/db

sudo chown 777 /data/db

echo "/usr/local/bin/zsh" >> /etc/shells
chsh -s /usr/local/bin/zsh

\curl -sSL https://get.rvm.io | bash
