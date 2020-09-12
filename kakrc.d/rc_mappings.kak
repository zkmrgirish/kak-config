# spell checking mappings
map global user s <a-i>w:spell-replace<ret> -docstring 'spell replace for word under the cursor'

# comment or uncomment selection
map global normal '#' :comment-line<ret> -docstring 'comment line'

# fzf search, kak-tree
map global user f :fzf-mode<ret> -docstring 'fuzzy search for files, buffer, lines etc.'
# map global user r :kaktree-toggle<ret> -docstring 'open or close kaktree for file explorer'

# vim like search patterns
map global user * <a-i>w*/<ret> -docstring 'search for all occurances of selected text'

# grep search
map global user n :grep-next-match<ret> -docstring 'next match of pattern in grep search'
map global user p :grep-previous-match<ret> -docstring 'next match of pattern in grep search'

# lsp document symbol
map global user ] :lsp-symbols-next-match<ret> -docstring 'next match document symbol table'
map global user [ :lsp-symbols-previous-match<ret> -docstring 'previous match document symbol table'

# goto [--] identifier
map global user <tab> '/\[--\]<ret>c' -docstring 'search for next [--] identifier'

# gopls related mappings
map global user k :lsp-hover<ret> -docstring 'get documentation for identifier uder cursor'

# open ide mode
map global normal <a-1> :ide<ret> -docstring 'init ide mode with jumpclient and toolsclient'

map global normal <a-2> :ktree<ret> -docstring 'open kaktree if toolsclient is available else create' 
