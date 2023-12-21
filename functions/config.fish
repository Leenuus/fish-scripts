function config
    set options (fish_opt -s t -l tmux)
    set options $options (fish_opt -s m -l mpv)
    set options $options (fish_opt -s f -l fish)
    set options $options (fish_opt -s n -l nvim)
    argparse $options -- $argv

    if test (which lvim)
        set editor lvim
    else
        set editor $EDITOR
    end

    if test -n "$_flag_tmux"
      echo "_flag_tmux:.$_flag_tmux..."
        $editor $HOME/.config/tmux/tmux.conf
    else if test -n "$_flag_mpv"
        $editor $HOME/.config/mpv
    else if test -n "$_flag_fish"
        $editor $HOME/.config/fish
    else if test -n "$_flag_nvim"
        $editor $HOME/.config/nvim
    else
        cd $HOME/.config/
    end
end
