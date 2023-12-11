function ex --description "Open Dolphin"
    nohup dolphin $argv[1] >/dev/null 2>&1 &
end
