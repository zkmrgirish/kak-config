# kak go formatting
hook global WinSetOption filetype=go %{
    hook buffer -group GoFmt BufWritePre .* format
    hook buffer -group GoFmt BufWritePost .* lsp-formatting
    set-option window makecmd 'go'

    alias window go make
}

# kak add gopls imports as format command
hook global BufCreate ".*.go" %{
    set-option buffer formatcmd "goimports"
}

hook global BufCreate ".*.yml" %{
    expandtab
    set buffer indentwidth 2
    set buffer tabstop 2
}

hook global WinSetOption filetype=terraform %{
    hook buffer -group TfFmt BufWritePre .* format
}

hook global BufCreate ".*.tf" %{
    expandtab
    set buffer indentwidth 2
    set buffer tabstop 2
    set buffer formatcmd "terraform fmt -"
}

hook global BufCreate ".*.tfvars" %{
    expandtab
    set buffer indentwidth 2
    set buffer tabstop 2
    set buffer formatcmd "terraform fmt -"
}

# rust hooks for formatting check and build
hook global WinSetOption filetype=rust %{
        set-option window formatcmd 'rustfmt'
        set-option window lintcmd 'cargo check'
        set-option window makecmd 'cargo'

        alias window cargo make

        map window user 1 ':nop %sh{cargo fmt}<ret>'
}

# hooks for visual feedback of modechange
hook global ModeChange ".*:normal" %{
    set-option global ui_options ncurses_wheel_scroll_amount=2 ncurses_enable_mouse=true ncurses_assistant=none
    set-face global PrimaryCursor black,white+Ffg
    set-face global StatusLine cyan,default
}

hook global ModeChange ".*:insert" %{
    set-option global ui_options ncurses_enable_mouse=false ncurses_assistant=none
    set-face global PrimaryCursor black,rgb:eddb81+Ffg
    set-face global StatusLine cyan,default
}

# disable ncurses_assistant on client create
hook global ClientCreate ".*" %{
    set-option global ui_options ncurses_wheel_scroll_amount=2 ncurses_enable_mouse=true ncurses_assistant=none
    set-face global PrimaryCursor black,white+Ffg
    set-face global StatusLine cyan,default
}

hook global InsertChar k %{ try %{
  exec -draft hH <a-k>jk<ret> d
  exec <esc>
}}

# enable flag-lines hl for git diff
hook global WinCreate .* %{
    add-highlighter window/git-diff flag-lines Default git_diff_flags
}
# trigger update diff if inside git dir
hook global BufOpenFile .* %{
    evaluate-commands -draft %sh{
        cd $(dirname "$kak_buffile")
        if [ $(git rev-parse --git-dir 2>/dev/null) ]; then
            for hook in WinCreate BufReload BufWritePost; do
                printf "hook buffer -group git-update-diff %s .* 'git update-diff'\n" "$hook"
            done
        fi
    }
}
