function fish_prompt --description 'Informative prompt'
    #Save the return status of the previous command
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    if test -n "$fish_private_mode"
        set fish_private_mode '(P)'
    end

    if functions -q fish_is_root_user; and fish_is_root_user
        printf '%s@%s %s%s%s# ' $USER (prompt_hostname) (set -q fish_color_cwd_root
                                                         and set_color $fish_color_cwd_root
                                                         or set_color $fish_color_cwd) \
            (prompt_pwd) (set_color normal)
    else
        set -l status_color (set_color $fish_color_status)
        set -l statusb_color (set_color --bold $fish_color_status)
        set -l pipestatus_string (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

        set -g __fish_git_prompt_showcolorhints 1
        set -g __fish_git_prompt_showdirtystate 1
        set -g __fish_git_prompt_showstashstate 1

        printf "[%s] %s%s@%s %s%s %s%s%s %s $fish_private_mode \n> " (date "+%H:%M:%S") (set_color brblue) \
            $USER (prompt_hostname) (set_color $fish_color_cwd) $PWD $pipestatus_string \
            (set_color normal) (fish_git_prompt)
    end
end
