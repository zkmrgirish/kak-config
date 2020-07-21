colorscheme desertex

# highlighters
set-face global comment rgb:7bcc7b+fga
set-face global BufferPadding rgb:404040

# find tags file and set ctagsfiles
hook global KakBegin .* %{
    evaluate-commands %sh{
        path="$PWD"
        while [ "$path" != "$HOME" ] && [ "$path" != "/" ]; do
            if [ -e "./tags" ]; then
                printf "%s\n" "set-option -add current ctagsfiles %{$path/tags}"
                break
            else
                cd ..
                path="$PWD"
            fi
        done
    }
}
