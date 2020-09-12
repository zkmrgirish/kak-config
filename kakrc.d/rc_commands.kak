# print power
define-command power -params 0 %{ echo %sh{ pmset -g batt | tail -n 1 | awk '{print $3}' | sed 's/;//g' } }

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

# horizontal split in tmux
define-command -docstring \
"vfind <filename>: search for file and open in new pane"\
sfind -params 1 -shell-script-candidates %{ kakfind } %{ iterm-terminal-horizontal kak -c %val{session} -e "edit %arg{1}" }

# new window in tmux
define-command -docstring \
"tfind <filename>: search for file and open in new window"\
tfind -params 1 -shell-script-candidates %{ kakfind } %{ iterm-terminal-tab kak -c %val{session} -e "edit %arg{1}" }

# kakoune ide mode
define-command ide -params 0..1 %{
    # change session
	try %{
		rename-session %arg{1}
	}

	# main client
    rename-client main
    set global jumpclient main

	# tools & docs client
	new rename-client tools
	
    # tools & docs client
    set global docsclient tools
    set global toolsclient tools
    iterm-terminal-horizontal zsh
} -docstring "turn kakoune into IDE"

# open kaktree
define-command ktree %{
    try %{
        evaluate-commands -client %opt{toolsclient} buffer *kaktree*
    } catch %{
        iterm-terminal-vertical kak -c %val{session} -e "kaktree-cmd"
    }
    focus %opt{toolsclient}
}

# change to camelcase
def camelcase %{
  exec '`s[-_<space>]<ret>d~<a-i>w'
}

# foo bar → foo_bar
def snakecase %{
  exec '<a-:><a-;>s-|[a-z][A-Z]<ret>;a<space><esc>s[-\s]+<ret>c_<esc><a-i>w`'
}

# fooBar → foo-bar
# foo_bar → foo-bar
# foo bar → foo-bar
def kebabcase %{
  exec '<a-:><a-;>s_|[a-z][A-Z]<ret>;a<space><esc>s[_\s]+<ret>c-<esc><a-i>w`'
}

define-command -hidden -params 2 inc %{
  evaluate-commands %sh{
    if [ "$1" = 0 ]
    then
	count=1
    else
	count="$1"
    fi
    printf '%s%s\n' 'exec h"_/\d<ret><a-i>na' "$2($count)<esc>|bc<ret>h"
  }
}
map global normal <c-a> ':inc %val{count} +<ret>'
map global normal <c-x> ':inc %val{count} -<ret>'
