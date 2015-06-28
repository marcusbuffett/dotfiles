for f in ".jshintrc" ".tmux.conf" ".vimrc" ".ycm_extra_conf.py" ".ycm_extra_conf.pyc" ".zshrc"
do
    rm ~/$f
    ln -s ~/dotfiles/$f ~/$f
    # do something on $f
done

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir ~/antigen
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/antigen/antigen.zsh

vim +PlugInstall
