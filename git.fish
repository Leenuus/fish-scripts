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
            git push $remote || return 1
            set_color blue
            echo -n "Finish push to remote: "
            set_color -u blue
            echo $remote
            set_color normal
        end
    else
        git push $argv
    end
end

function gitpl
    if test -z $argv
        git pull origin || return 1
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
