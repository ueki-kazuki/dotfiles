# Defined in /var/folders/wk/ryyk_s_13lx2pb2cjj4hk7tdkb3vt9/T//fish.NAyGTm/fish_prompt.fish @ line 2
function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

    # User
    set_color $fish_color_user
    echo -n (whoami)
    set_color normal

    echo -n '@'

    # Host
    set_color $fish_color_host
    echo -n (prompt_hostname)
    set_color normal

    echo -n ':'

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    __terlar_git_prompt
    __fish_hg_prompt

    # TIME
    set_color $fish_color_purple
    set -l time (date "+%H:%M:%S")
    echo -n " [$time]"
    set_color normal

    # NEW LINE
    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n '$ '
    set_color normal
end
