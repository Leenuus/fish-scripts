function tt
    set opts (fish_opt -s f -l fish)
    set opts $opts (fish_opt -s p -l python)
    set opts $opts (fish_opt -s b -l bash)
    argparse $opts -- $argv

    set -l f (mktemp)
    if test -n "$_flag_python"
        set prog python
        mv "$f" "$f.py"
        set f "$f.py"
        echo "#! /bin/python" >"$f"
    else if test -n "$_flag_bash"
        set prog bash
        mv "$f" "$f.sh"
        set f "$f.sh"
        echo "#! /bin/bash" >"$f"
    else
        set prog fish
        mv "$f" "$f.fish"
        set f "$f.fish"
        echo "#! /bin/fish" >"$f"
    end
    if test (which lvim)
        set editor lvim
    else
        set editor $EDITOR
    end

    "$editor" "$f"
    "$prog" "$f"
end
