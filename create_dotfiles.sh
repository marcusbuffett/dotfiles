for f in ".jshintrc" ".tmux.conf" ".nvimrc" ".vimrc" ".ycm_extra_conf.py" ".ycm_extra_conf.pyc" ".zshrc" ".tmux-osx.conf" ".weechat" ".gitignore" "./agnoster.zsh-theme"
do
    rm ~/$f
    ln -s ~/dotfiles/$f ~/$f
done

mkdir -p $HOME/.config
ln -s ~/.vim $HOME/.config/nvim
ln -s ~/.vimrc $HOME/.config/nvim/init.vim
