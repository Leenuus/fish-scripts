## quick edit common used files in Projects

function q
    set opts (fish_opt -s g -l gitignore)
    set opts $opts (fish_opt -s m -l makefile)
    set opts $opts (fish_opt -s c -l cmake)
    set opts $opts (fish_opt -s r -l rust)

    argparse $opts -- $argv

    if test (which lvim)
        set editor lvim
    else
        set editor $EDITOR
    end

    if test -n "$_flag_g"
        $editor ./.gitignore
    else if test -n "$_flag_m"
        $editor ./Makefile
    else if test -n "$_flag_c"
        $editor ./CMakeFile.txt
    else if test -n "$_flag_r"
        $editor ./src/main.rs
    else
        $editor ./README.md
    end
end
