function tmp
    set -l f (mktemp)
    $EDITOR $f
end
