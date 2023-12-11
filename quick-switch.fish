set -gx RECENT_PROJECTS $HOME/.recent_projects

function get-recents
    if test -f $RECENT_PROJECTS
        cat $RECENT_PROJECTS
    end
end

function g
    cd $argv[1]
end

function add-project
    set -l path (realpath ./)
    echo "$argv[1] $path" >>$RECENT_PROJECTS
end

# completions for function `g`

complete -c g -f

for line in (get-recents)
    set -l path (echo $line | cut '-d ' -f 2)
    set -l name (echo $line | cut '-d ' -f 1)
    complete -c g -a $path -d $name
end
