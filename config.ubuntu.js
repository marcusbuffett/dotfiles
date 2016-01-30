for f in ".jshintrc" ".tmux.conf" ".nvimrc" ".vimrc" ".ycm_extra_conf.py" ".ycm_extra_conf.pyc" ".zshrc" ".tmux-osx.conf" ".weechat"
do
    rm ~/$f
    ln -s ~/dotfiles/$f ~/$f
    # do something on $f
done

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir ~/antigen
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/antigen/antigen.zsh

git config --global user.name "Marcus Buffett"
git config --global user.email "marcusbuffett@me.com"

sudo apt-get install -y zsh

chsh -s `which zsh`

# vim +PlugInstall
