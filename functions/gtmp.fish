function gtmp
    set -l tmp (mktemp -d)
    cd $tmp
    set_color blue
    echo -e "Switch to Dir: $tmp"
    set_color normal
end
