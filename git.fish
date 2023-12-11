function git-add-identity
    set -gx SSH_AUTH_SOCK (find /tmp -maxdepth 1 -name 'ssh-XXXXXX*' -exec find {} -name 'agent*' \;)
    if test -n "$SSH_AUTH_SOCK"
        # ssh-agent exists
        # /tmp/ssh-XXXXXXBFtjyN
        set -gx SSH_AGENT_PID (ps aux | grep 'ssh-agent' | sed '2d' | awk '{print $2}')
        ssh-add ~/.ssh/github
        ssh-add ~/.ssh/codeberg
    else
        # agent not exists
        eval (ssh-agent -c)
        ssh-add ~/.ssh/github
        ssh-add ~/.ssh/codeberg
    end
end


function gita
    if test -z $argv
        git add .
    else
        git add $argv
    end
    git status
end


function gitps
    if test -z $argv
        for remote in (git remote)
            git push $remote
            set_color blue
            echo "Finish push to remote $remote"
            set_color normal
        end
    else
        git push $argv
    end
end

function gitpl
    if test -z $argv
        git pull origin
    else
        git pull $argv
    end
end

abbr -a gitc "git commit"

abbr -a gits "git status"

abbr -a giti "git init"

abbr -a gitm "git merge "

abbr -a gitcl "git clone"

abbr -a gitd "git diff"

abbr -a gitl "git log"

abbr -a git-config "git config --global -l"

abbr -a gitb "git branch "

abbr -a gitch "git checkout "
