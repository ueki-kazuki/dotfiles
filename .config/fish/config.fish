# set -x LANG ja_JP.utf8
set EDITOR vim
set fish_prompt_hg_status_added "+"
set fish_color_autosuggestion brblack
set -x PATH /usr/local/bin $PATH
. (pyenv init - | psub)
. (rbenv init - | psub)
eval (direnv hook fish)

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
end

# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
complete -c aws -f -a '(begin; set -lx COMP_SHELL fish; set -lx COMP_LINE (commandline); /usr/local/bin/aws_completer; end)'

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true

# alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v (pwd):/aws amazon/aws-cli'


set -x PIPENV_VENV_IN_PROJECT true
set -x PIPENV_VERBOSITY -1

# curl is keg-only, which means it was not symlinked into /usr/local,
# need to have curl first in the PATH
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths

alias ae="[ -x deactivate ] && deactivate >/dev/null 2>&1; source ./venv/bin/activate.fish"
alias de="deactivate"
alias vim="nvim"
alias vi="nvim"
