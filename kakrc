# My minimal kakrc
# Author: zkmrgirish

# plugins for kak
source "%val{config}/plugins/plug.kak/rc/plug.kak"

plug "andreyorst/fzf.kak"
plug "alexherbo2/auto-pairs.kak"
plug "andreyorst/smarttab.kak"
plug "TeddyDD/kakoune-wiki"
plug "zkmrgirish/kakoune-plain" theme
plug "zkmrgirish/kak-todo"
plug "andreyorst/kaktree" config %{
    hook global WinSetOption filetype=kaktree %{
        remove-highlighter buffer/numbers
        remove-highlighter buffer/matching
        remove-highlighter buffer/wrap
        remove-highlighter buffer/show-whitespaces
    }
    kaktree-enable
}

define-command import -params 1 %{
    try %{
        source %sh{ echo ~/.config/kak/kakrc.d/$1.kak }
    }
}

import rc_commands
import rc_mappings
import rc_hooks
import rc_misc
import rc_magic
import rc_mirror
import rc_easymotion
import rc_usermodes
import rc_options

# kakwiki setup
wiki-setup %sh{ echo $HOME/wiki }

# enable kakoune lsp support
eval %sh{kak-lsp --kakoune -s $kak_session}
lsp-enable
