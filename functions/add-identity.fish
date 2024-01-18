set __ssh_pems "~/.ssh/pems"

function add-identity
    set -gx SSH_AUTH_SOCK (find /tmp -maxdepth 1 -name 'ssh-XXXXXX*' -exec find {} -name 'agent*' \;)
    if test -n "$SSH_AUTH_SOCK"
        # ssh-agent exists
        # /tmp/ssh-XXXXXXBFtjyN
        set -gx SSH_AGENT_PID (ps aux | grep 'ssh-agent' | sed '2d' | awk '{print $2}')
    else
        # agent not exists
        eval (ssh-agent -c) >/dev/null
    end
    ssh-add "$__ssh_pems/*" >/dev/null 2>&1
end
