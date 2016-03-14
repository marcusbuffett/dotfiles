for f in $(find ~/dotfiles -regex "\./\..*") 
do
  g=$(echo $f | cut -c 3-)
  rm ~/$g
  ln -s ~/dotfiles/$g ~/$g
done

mkdir -p ~/.config/nvim
ln -s ~/.vim ~/.nvim

sudo apt-get update
sudo apt-get install -y zsh python-dev curl cmake tmux build-essential
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim
sudo apt-get install -y python-dev python-pip python3-dev python3-pip

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir ~/antigen
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/antigen/antigen.zsh

git config --global user.name "Marcus Buffett"
git config --global user.email "marcusbuffett@me.com"


chsh -s `which zsh`

# vim +PlugInstall
