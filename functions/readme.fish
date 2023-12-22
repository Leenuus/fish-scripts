function readme
    if test (which lvim)
        lvim ./README.md
    else
        $EDITOR ./README.md
    end
end

abbr -a me readme
