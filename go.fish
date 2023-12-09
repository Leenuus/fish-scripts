abbr -a pp prevd
abbr -a p 'nextd'
abbr -a cc "cd .."

function gtmp
        set -l tmp (mktemp -d)
        echo -e "Switch to Dir: $tmp"
        cd $tmp
end
