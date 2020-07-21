# set tab option
set-option global tabstop 4

# use sapce not tabs
set-option global aligntab true

# use ripgrep for grepcmd
set-option global grepcmd 'rg -Hn'

set-option global modelinefmt '%val{bufname} %val{cursor_line}:%val{cursor_char_column} {{context_info}} {{mode_info}} - %val{client}@[%val{session}] | %sh{ power } | %sh{ date +"%I:%M %p" }'

# change face for primary and seconday selection
set-face global PrimarySelection white,rgb:505050+Ffg
set-face global SecondarySelection rgb:52ff52,rgb:505050+Ffg
