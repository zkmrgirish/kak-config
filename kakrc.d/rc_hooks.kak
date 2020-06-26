# kak go formatting
hook global WinSetOption filetype=go %{
    set-option window formatcmd 'gofmt'
    hook buffer -group GoFmt BufWritePre .* format
    set-option window formatcmd 'goimports'
    hook buffer -group GoFmt BufWritePre .* format
    set-option window makecmd 'go build'
}

# rust hooks for formatting check and build
hook global WinSetOption filetype=rust %{
        set-option window formatcmd 'rustfmt'
        set-option window lintcmd 'cargo check'
        set-option window makecmd 'cargo build'

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
