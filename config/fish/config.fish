set -g EDITOR lvim
set -g PATH $HOME/.cargo/bin $PATH
set -g AWS_KEYPAIR_NAME Marcus

alias v="lvim"
alias tmux="tmux -2"

# Git aliases
alias fusro 'git push origin HEAD'
alias fusrodah 'git push --force origin HEAD'
alias fuck_it_lets_do_it_live 'git add -u && git commit --amend --no-edit && git push --force origin HEAD'
alias g 'git'
alias gm 'git merge'
alias gcl 'git clone'
alias gc! "git commit --amend"
alias glg 'git log'
alias glf 'git ls-files'
alias gau 'git add -u'
alias grbom 'git rebase origin/master'
alias gcd 'git checkout develop'
alias gl 'git pull'
alias gcb "git checkout -B" 
alias grb "git rebase"
alias grbi "git rebase -i"
alias grba "git rebase --abort"
alias grbs "git rebase --skip"
alias grbc "git rebase --continue"
alias gd "git diff"
alias gdca "git diff --cached"
alias gstl "git stash list"
alias ga "git add"
alias gc "git commit"
alias gcp "git cherry-pick"
alias gf "git fetch"
alias gco 'git checkout'
alias gss 'git status --short'
alias gs 'git status'
alias gcm 'git checkout master'
alias gsta "git stash"
alias gstaa "git stash apply"
alias f_grecb "git for-each-ref --sort=committerdate refs/heads/ --format='%(refname:short)' | tac | fzf --no-sort | xargs git checkout"
fish_vi_key_bindings

fish_add_path $HOME/.local/bin
fish_add_path $HOME/Library/Haskell/bin
fish_add_path $HOME/.cabal/bin

function zd
  cd (z -l | fzf | tr -s ' ' | cut -d ' ' -f 2)
end

fish_add_path ./node_modules/.bin

bind \cP history-search-backward
bind \cN history-search-forward
