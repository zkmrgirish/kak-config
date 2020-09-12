# comment or uncomment selection
map global normal '#' :comment-line<ret> -docstring 'comment line'

# vim like search patterns
map global user * <a-i>w*/<ret> -docstring 'search for all occurances of selected text'

# some custom user modes
map global user f :fzf-mode<ret> -docstring 'fuzzy search for files, buffer, lines etc.'
map global user l ": enter-user-mode lsp-mode<ret>" -docstring "enter lsp use mode"
map global user s ": enter-user-mode -lock spell<ret>" -docstring "spell mode"
map global user g ": enter-user-mode -lock grep<ret>" -docstring "grep mode"
map global user m ": enter-user-mode -lock keep<ret>" -docstring "filter selections"
map global user t ": enter-user-mode trim<ret>" -docstring "trim selection part"
map global user r ": enter-user-mode rotation<ret>" -docstring "rotate selection"
map global user e ": enter-user-mode  easymotion<ret>" -docstring "easymotion mode"


# open ide mode
map global normal <a-1> :ide<ret> -docstring 'init ide mode with jumpclient and toolsclient'
map global normal <a-2> :ktree<ret> -docstring 'open kaktree if toolsclient is available else create' 
