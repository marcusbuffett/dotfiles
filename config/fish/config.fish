set -g EDITOR nvim
set -g PATH $HOME/.cargo/bin $PATH
set -g AWS_KEYPAIR_NAME Marcus
set -g NPM_HOME "$HOME/.npm/"
set -g PQ_LIB_DIR "$(brew --prefix libpq)/lib"

alias v="nvim"
alias tmux="tmux -2"

# Git aliases
alias fusro 'git push origin HEAD'
alias fusrodah 'git push --force origin HEAD'
alias fuck_it_lets_do_it_live 'git add -u && git commit --amend --no-edit && git push --force origin HEAD'
alias g 'git'
alias k 'kubectl'
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
fish_add_path /opt/homebrew/bin
fish_add_path /Users/marcusbuffett/.linkerd2/bin
fish_add_path /opt/homebrew/opt/libpq/bin

function zd
  cd (z -l | fzf | tr -s ' ' | cut -d ' ' -f 2)
end

# fish_add_path ./node_modules/.bin

bind \cP history-search-backward
bind \cN history-search-forward

function exec_env
  for file in (exec-env);
    source $file;
  end
end

function preexec_test --on-variable PWD
  exec_env
end

exec_env
fish_add_path /opt/homebrew/opt/llvm/bin


# Setting PATH for Python 3.10
# The original version is saved in /Users/marcusbuffett/.config/fish/config.fish.pysave
# set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"
alias python "/Library/Frameworks/Python.framework/Versions/3.10/bin/python3.10"
alias python3 "/Library/Frameworks/Python.framework/Versions/3.7/bin/python3"

starship init fish | source

function envsource
  for line in (cat $argv | grep -v '^#' | grep -v '^\s*$')
    set item (string split -m 1 '=' $line)
    set -gx $item[1] $item[2]
    echo "Exported key $item[1]"
  end
end
