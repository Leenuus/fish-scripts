### add http proxy ###

function getproxy
    set_color blue
    echo http_proxy: $http_proxy
    echo https_proxy: $https_proxy
    echo HTTPS_PROXY: $HTTPS_PROXY
    echo all_proxy: $all_proxy
    echo ALL_PROXY: $ALL_PROXY
    echo
    set_color normal
end

function setproxy
    set options (fish_opt -s a -l address -r)
    set options $options (fish_opt -s p -l port -r)
    argparse $options -- $argv
    if test -n "$_flag_address"
        set $PROXY_SERVER $_flag_address
    else
        set -gx PROXY_SERVER "127.0.0.1"
    end
    if test -n "$_flag_port"
        set $PROXY_PORT $_flag_port
    else
        set -gx PROXY_PORT 7890
    end

    set -gx http_proxy "http://$PROXY_SERVER:$PROXY_PORT"
    set -gx https_proxy "http://$PROXY_SERVER:$PROXY_PORT"
    set -gx HTTPS_PROXY "http://$PROXY_SERVER:$PROXY_PORT"
    set -gx all_proxy "socks5://$PROXY_SERVER:$PROXY_PORT"
    set -gx ALL_PROXY "socks5://$PROXY_SERVER:$PROXY_PORT"

    set_color red
    echo proxy set!
    set_color normal

    getproxy
end


function unsetproxy
    set -e http_proxy
    set -e https_proxy
    set -e HTTPS_PROXY
    set -e all_proxy
    set -e ALL_PROXY

    set_color red
    echo proxy unset!
    set_color normal
end
