# NOTE: have to take care of racer + rust src stuff

for f in ".tmux.conf" ".zshrc" ".tmux-osx.conf" ".gitignore"
do
    rm ~/$f
    ln -s ~/dotfiles/$f ~/$f
done

mkdir -p ~/.config/nvim
ln -s ~/.nvimrc ~/.config/nvim/init.vim

npm install -g eslint

curl https://pyenv.run | bash

git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack


