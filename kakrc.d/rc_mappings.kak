# spell checking mappings
map global user s <a-i>w:spell-replace<ret> -docstring 'spell replace for word under the cursor'

# vim like deletion, yank
map global normal D Gld -docstring 'delete to end of the line'
map global normal Y Gly -docstring 'yank to end of the line'

# comment or uncomment selection
map global user c :comment-line<ret> -docstring 'comment line'

# ctags search selection
map global user t <a-i>w:ctags-search<ret> -docstring 'search word under the cursor using ctags'

# open terminal zsh
map global user T ':terminal zsh<ret>' -docstring 'open terminal in current directory'

# fzf search, kak-tree
map global user f :fzf-mode<ret> -docstring 'fuzzy search for files, buffer, lines etc.'
map global user r :kaktree-toggle<ret> -docstring 'open or close kaktree for file explorer'

# vim like search patterns
map global user * <a-i>w*/<ret> -docstring 'search for all occurances of selected text'

# grep search
map global user n :grep-next-match<ret> -docstring 'next match of pattern in grep search'
map global user p :grep-previous-match<ret> -docstring 'next match of pattern in grep search'

# goto [--] identifier
map global user <tab> '/\[--\]<ret>c' -docstring 'search for next [--] identifier'

# gopls related mappings
map global user k :lsp-hover<ret> -docstring 'get documentation for identifier uder cursor'

