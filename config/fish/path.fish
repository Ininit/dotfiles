# ========== MIRROR ========== #
set -x PATH "/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/sbin" $PATH

# ========== PATH ========== #
if test -d /usr/local/sbin
  set -g fish_user_paths /usr/local/sbin $fish_user_paths
end

if test -d $HOME/bin
  set -gx fish_user_paths $HOME/bin $fish_user_paths
end

if test -d $DOTFILES/bin
  set -gx fish_user_paths $DOTFILES/bin $fish_user_paths
end

if test -d /usr/local/bin
  set -gx fish_user_paths /usr/local/bin $fish_user_paths
end

set -gx GOPATH $HOME/go
if test -d $GOPATH/bin
  set -gx fish_user_paths $GOPATH/bin $fish_user_paths
end

# rust
if test -d $HOME/.cargo/bin
  set -gx fish_user_paths $HOME/.cargo/bin $fish_user_paths
end

# deno
if test -d $HOME/.deno/bin
  set -gx fish_user_paths $HOME/.deno/bin $fish_user_paths
end

# go
if test -d /usr/local/go/bin
  set -gx fish_user_paths /usr/local/go/bin $fish_user_paths
end

# yarn
if test -d $HOME/.yarn/bin
  set -gx fish_user_paths $HOME/.yarn/bin $fish_user_paths
end

# auto-npx
if test $TERM_PROGRAM = "vscode" 
  and test -d "$PWD/node_modules/.bin"
  fish_add_path $PWD/node_modules/.bin
end
