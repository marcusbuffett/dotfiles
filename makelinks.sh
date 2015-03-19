for f in ".jshintrc" ".tmux.conf" ".vimrc" ".ycm_extra_conf.py" ".ycm_extra_conf.pyc" ".zshrc"
do
    trash ~/$f
    ln -s ~/.dotfiles/$f ~/$f
    # do something on $f
done
