for f in ".jshintrc" ".tmux.conf" ".nvimrc" ".vimrc" ".ycm_extra_conf.py" ".ycm_extra_conf.pyc" ".zshrc" ".tmux-osx.conf" ".weechat" ".gitignore"
do
    rm ~/$f
    ln -s ~/dotfiles/$f ~/$f
done

mkdir -p ~/.config/nvim
ln -s ~/.vim ~/.nvim

while [ 1 ]
do
  if xcode-select -p &> /dev/null; then
    brew install python
    break
  else
    sleep 5
  fi
done

npm install -g bower grunt-cli babel eslint gh grunt gulp how2 http-server js-beautify jshint nodemon mocha uglify

pip install thefuck simplewatch chess-cli

gem install sass

brew install awscli cloc cabal-install cmake git ghc haskell-stack node tmux mongodb openssl python python3 phantomjs tree weechat wget zsh

mkdir -p /data/db

sudo chown 777 /data/db

chsh -s /usr/local/bin/zsh
