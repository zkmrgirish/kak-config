# kak go formatting
hook global WinSetOption filetype=go %{
    set-option window formatcmd 'gofmt'
    hook buffer -group GoFmt BufWritePre .* format
    set-option window formatcmd 'goimports'
    hook buffer -group GoFmt BufWritePre .* format
    set-option window makecmd 'go'

    alias window go make
}

hook global BufCreate ".*.tf" %{
    expandtab
    set buffer indentwidth 2
}

# rust hooks for formatting check and build
hook global WinSetOption filetype=rust %{
        set-option window formatcmd 'rustfmt'
        set-option window lintcmd 'cargo check'
        set-option window makecmd 'cargo'

        alias window c make

        map window user 1 ':nop %sh{cargo fmt}<ret>'
}

# python hooks for formatting
hook global WinSetOption filetype=python %{
	set-option window formatcmd 'indent'
	hook buffer -group pyfmt BufWritePre .* format
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
