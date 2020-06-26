# print power
define-command power -params 0 %{ echo %sh{ power } }

# print time
define-command time -params 0 %{ echo %sh{ date +'%I:%M %p' } }

# git ls-files fuzzy search
define-command -docstring \
"gfind <filename>: search for files using git ls-files" \
gfind -params 1 -shell-script-candidates %{ git ls-files } %{ edit %arg{1} }

# fuzzy search like vim find
define-command -docstring \
"find <filename>: search for files using find"\
find -params 1 -shell-script-candidates %{ kakfind } %{ edit %arg{1} }

# vertical split in tmux
define-command -docstring \
"vfind <filename>: search for file and open in new pane"\
vfind -params 1 -shell-script-candidates %{ kakfind } %{ new edit %arg{1} }

# new window in tmux
define-command -docstring \
"tfind <filename>: search for file and open in new window"\
tfind -params 1 -shell-script-candidates %{ kakfind } %{ tmux-terminal-window kak -c %val{session} %arg{1} }
