for f in ".jshintrc" ".tmux.conf" ".nvimrc" ".vimrc" ".ycm_extra_conf.py" ".ycm_extra_conf.pyc" ".zshrc" ".tmux-osx.conf" ".gitignore" ".zprofile"
do
    rm ~/$f
    ln -s ~/dotfiles/$f ~/$f
done

ln -s ~/dotfiles/.zshinit.private.encrypted ~/.zshinit.private

mkdir -p $HOME/.config
ln -s ~/.vim $HOME/.config/nvim
ln -s ~/.vimrc $HOME/.config/nvim/init.vim
