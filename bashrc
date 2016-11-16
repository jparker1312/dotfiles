function cd {
    builtin cd "$@" && ls -laF
    }
