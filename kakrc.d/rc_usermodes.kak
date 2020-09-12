# generic lsp mode lsp-workspace-symbol-incr
declare-user-mode lsp-mode
map global lsp-mode d ": lsp-diagnostics<ret>" -docstring "run diagnostics"
map global lsp-mode e ": lsp-find-error<ret>" -docstring "find error in current buffer"
map global lsp-mode r ": lsp-rename-prompt<ret>" -docstring "rename selected identifier"
map global lsp-mode s ": lsp-document-symbol<ret>:enter-user-mode -lock lsp-document-symbol<ret>" -docstring "create document symbol"
map global lsp-mode * ": lsp-references<ret>:enter-user-mode -lock lsp-references<ret>" -docstring "lsp-references for selected text"
map global lsp-mode k ": lsp-hover<ret>" -docstring "see documentation for identifier under cursor"
map global lsp-mode q ": lsp-workspace-symbol-incr<ret>" -docstring "query project symbols"


# document symbol mode
declare-user-mode lsp-document-symbol
map global lsp-document-symbol n ": lsp-symbols-next-match<ret>" -docstring "next document symbol"
map global lsp-document-symbol p ": lsp-symbols-previous-match<ret>" -docstring "previous document symbol"

# lsp-references mode
declare-user-mode lsp-references
map global lsp-references n ": lsp-references-next-match<ret>" -docstring "next match in references"
map global lsp-references p ": lsp-references-previous-match<ret>" -docstring "previous match in references"
map global lsp-references h ": lsp-highlight-references<ret>" -docstring "highlight references"


declare-user-mode grep
map global grep n ": grep-next-match<ret>" -docstring "grep next match"
map global grep p ": grep-previous-match<ret>" -docstring "grep previous match"

declare-user-mode spell
map global spell n ": spell-next<ret>" -docstring "next spelling"
map global spell r ": spell-replace<ret>" -docstring "replcae spelling"
map global spell a ": spell-add<ret>:spell<ret>" -docstring "ignore spelling"
map global spell c ": spell-clear<ret>" -docstring "clear spelling"

declare-user-mode keep
map global keep m '<esc><a-k>'                                      -docstring 'regex matching'
map global keep n '<esc><a-K>'                                      -docstring 'regex not matching'
map global keep p '<esc>$'                                          -docstring 'pipe'
map global keep l '<esc>$[ ${#kak_selection} -gt  ]<left><left>'    -docstring 'length'
map global keep h '<esc>$[ $kak_main_reg_hash -le  ]<left><left>'   -docstring 'head'
map global keep e '<esc>$[ $((kak_main_reg_hash % 2)) -eq 0 ]<ret>' -docstring 'even'
map global keep o '<esc>$[ $((kak_main_reg_hash % 2)) -eq 1 ]<ret>' -docstring 'odd'

declare-user-mode trim
map global trim h '<esc>s^\h+<ret><a-d>'           -docstring '← trim selections content start'
map global trim j '<esc>S^\s+<ret><a-k>\S<ret>'    -docstring '← trim start'
map global trim T '<esc>s^\h+|\h+$<ret><a-d>'      -docstring '↔ trim selections content both'
map global trim t '<esc>_'                         -docstring '↔ trim both'
map global trim k '<esc>S\s+$|\n<ret><a-k>\S<ret>' -docstring '→ trim end'
map global trim l '<esc>s\h+$<ret><a-d>'           -docstring '→ trim selections content end'


declare-user-mode rotation
map global rotation h '<esc><a-(>' -docstring '← rotate selections content'
map global rotation j '<esc>('     -docstring '← rotate main selection'
map global rotation k '<esc>)'     -docstring '→ rotate main selection'
map global rotation l '<esc><a-)>' -docstring '→ rotate selections content'
