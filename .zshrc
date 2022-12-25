# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins+=(zsh-vi-mode)
function my_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}
zvm_after_init_commands+=(my_init)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# zi is from zoxide, but I'm used to zd
alias zd=zi


alias v="nvim"
alias tmux="tmux -2"

# Git aliases
alias fusro='git push origin HEAD'
alias fusrodah='git push --force origin HEAD'
alias fuck_it_lets_do_it_live='git add -u && git commit --amend --no-edit && git push --force origin HEAD'
alias g='git'
alias k='kubectl'
alias lk='kubectl -n local-dev'
alias gm='git merge'
alias gcl='git clone'
alias gc!="git commit --amend"
alias glg='git log'
alias glf='git ls-files'
alias gau='git add -u'
alias grbom='git rebase origin/master'
alias gcd='git checkout develop'
alias gl='git pull'
alias gcb="git checkout -B" 
alias grb="git rebase"
alias grbi="git rebase -i"
alias grba="git rebase --abort"
alias grbs="git rebase --skip"
alias grbc="git rebase --continue"
alias gd="git diff"
alias gdca="git diff --cached"
alias gstl="git stash list"
alias ga="git add"
alias gc="git commit"
alias gcp="git cherry-pick"
alias gf="git fetch"
alias gco='git checkout'
alias gss='git status --short'
alias gs='git status'
alias gcm='git checkout master'
alias gsta="git stash"
alias gstaa="git stash apply"
alias f_grecb="git for-each-ref --sort=committerdate refs/heads/ --format='%(refname:short)' | tac | fzf --no-sort | xargs git checkout"
alias prsb='gh pr list --author "@me" -w --repo "https://github.com/ProjectOpenSea/opensea-api"'
alias prsf='gh pr list --author "@me" -w --repo "https://github.com/ProjectOpenSea/opensea-next"'

eval "$(fnm env --use-on-cd)"

source "/opt/homebrew/opt/spaceship/spaceship.zsh"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.local/bin:$PATH"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.secrets.zsh

export ADOBE_CONTENT_AUTHENTICITY_CLAIM_TOOL_PATH="packages/adobe-cai-cli/macos"
export RSVG_CONVERT_PATH=/usr/local/bin

pyenv activate opensea
eval "$(zoxide init zsh)"

export PATH="$PATH:/Users/marcusbuffett/.foundry/bin"
source <(kubectl completion zsh)
