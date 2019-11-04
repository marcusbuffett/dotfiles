echo "Profile sourced!"
source /usr/local/opt/nvm/nvm.sh --no-use

eval "$(fasd --init posix-alias zsh-hook)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -zsh --no-rehash)"
fi

