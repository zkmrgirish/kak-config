# some magic here
def suspend-and-resume \
    -params 1..2 \
    -docstring 'suspend-and-resume <cli command> [<kak command after resume>]: backgrounds current kakoune client and runs specified cli command.  Upon exit of command the optional kak command is executed.' \
    %{
    try %{ tq }
   	evaluate-commands %sh{

    # Note we are adding '&& fg' which resumes the kakoune client process after the cli command exits
    cli_cmd="$1 && fg"
    post_resume_cmd="$2"

    # automation is different platform to platform
    platform=$(uname -s)
    case $platform in
        Darwin)
            automate_cmd="sleep 0.01; osascript -e 'tell application \"System Events\" to keystroke \"$cli_cmd\" & return '"
            kill_cmd="/bin/kill"
            break
            ;;
        Linux)
            automate_cmd="sleep 0.2; xdotool type '$cli_cmd'; xdotool key Return"
            kill_cmd="/usr/bin/kill"
            break
            ;;
    esac

    # Uses platforms automation to schedule the typing of our cli command
    nohup sh -c "$automate_cmd"  > /dev/null 2>&1 &
    # Send kakoune client to the background
    $kill_cmd -SIGTSTP $kak_client_pid

    # ...At this point the kakoune client is paused until the " && fg " gets run in the $automate_cmd

    # Upon resume, run the kak command is specified
    if [ ! -z "$post_resume_cmd" ]; then
        echo "$post_resume_cmd"
    fi
}}

# -------------------------------------------------------------------------------
# tig for git

def tig-blame -override -docstring 'Open blame in tig for current file and line' %{
    # Note here we aren't passing any command on resume of kakoune
    suspend-and-resume "tig blame +%val{cursor_line} %val{buffile}" 
}

declare-user-mode git
map global git l ': suspend-and-resume "lazygit"<ret>' -docstring 'use lazygit for git operations'
map global git b ': tig-blame<ret>' -docstring 'show blame (with tig)'
map global git p ': suspend-and-resume "git push origin HEAD"<ret>' -docstring 'git push origin HEAD'
map global git r ': suspend-and-resume "gh pr create -B master"<ret>' -docstring 'create pr against master'

map global user t ': enter-user-mode git<ret>' -docstring 'git command mode'


# -------------------------------------------------------------------------------
# ranger 

def for-each-line \
    -docstring "for-each-line <command> <path to file>: run command with the value of each line in the file" \
    -params 2 \
    %{ evaluate-commands %sh{

    while read f; do
        printf "$1 $f\n"
    done < "$2"
}}

def toggle-ranger %{
    suspend-and-resume \
        "ranger --choosefiles=/tmp/ranger-files-%val{client_pid}" \
        "for-each-line edit /tmp/ranger-files-%val{client_pid}"
}

map global user r ': toggle-ranger<ret>' -docstring 'select files in ranger'
