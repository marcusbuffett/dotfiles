for f in ".jshintrc" ".tmux.conf" ".nvimrc" ".vimrc" ".ycm_extra_conf.py" ".ycm_extra_conf.pyc" ".zshrc" ".tmux-osx.conf"
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

# vim +PlugInstall

