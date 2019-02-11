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
