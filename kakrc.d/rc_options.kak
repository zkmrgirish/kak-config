# set tab option
set-option global tabstop 4

# use sapce not tabs
set-option global aligntab true

# use ripgrep for grepcmd
set-option global grepcmd 'rg -HLn'

# use toolsclient for kaktree
set-option global kaktreeclient 'tools'

set-option global modelinefmt '%val{bufname} %val{cursor_line}:%val{cursor_char_column} {{context_info}} {{mode_info}} - %val{client}@[%val{session}] | %sh{ date +"%I:%M %p" }'
set-option global startup_info_version 20211231
