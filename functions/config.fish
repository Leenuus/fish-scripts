function config
    set options (fish_opt -s t -l tmux)
    set options $options (fish_opt -s m -l mpv)
    set options $options (fish_opt -s f -l fish)
    set options $options (fish_opt -s n -l nvim)
    set options $options (fish_opt -s a -l alacritty)
    set options $options (fish_opt -s l -l lvim)
    set options $options (fish_opt -s s -l ssh)
    set options $options (fish_opt -s x -l tmuxifier)
    set options $options (fish_opt -s d -l directory)
    argparse $options -- $argv

    if test -n "$_flag_tmux"
        set config_dir $HOME/.config/tmux/tmux.conf
    else if test -n "$_flag_mpv"
        set config_dir $HOME/.config/mpv
    else if test -n "$_flag_fish"
        set config_dir $HOME/.config/fish
    else if test -n "$_flag_nvim"
        set config_dir $HOME/.config/nvim
    else if test -n "$_flag_a"
        set config_dir $HOME/.config/alacritty/
    else if test -n "$_flag_lvim"
        set config_dir $HOME/.local/share/lunarvim/lvim/
    else if test -n "$_flag_ssh"
        set config_dir $HOME/.ssh/config
    else if test -n "$_flag_tmuxifier"
        set config_dir $HOME/.config/tmux/plugins/tmuxifier/layouts/
    else
        cd $HOME/.config/
        return
    end

    if test -n "_flag_d"
        cd "$config_dir"
    end

    if test -n "$editor"
        $editor "$config_dir"
    else
        $EDITOR "$config_dir"
    end
end
