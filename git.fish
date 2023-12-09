function git-add-identity
				# reuse ssh-agent
				# auto add git credentials
				set -gx SSH_AUTH_SOCK (find /tmp -maxdepth 1 -name 'ssh-XXXXXX*' -exec find {} -name 'agent*' \;)
				if test -n "$SSH_AUTH_SOCK"
								# ssh-agent exists
								# /tmp/ssh-XXXXXXBFtjyN
								set -gx SSH_AGENT_PID (ps aux | grep 'ssh-agent' | sed '2d' | awk '{print $2}')
								ssh-add ~/.ssh/github
								ssh-add ~/.ssh/codeberg
				else
								# agent not exists
								eval (ssh-agent -c)
								ssh-add ~/.ssh/github
								ssh-add ~/.ssh/codeberg
				end
end

abbr -a gita "git add"

abbr -a gitc "git commit"

abbr -a gits "git status"

abbr -a giti "git init"

abbr -a gitpl "git pull"

# abbr -a gitps "git push "

abbr -a gitm "git merge "

abbr -a gitcl "git clone"

abbr -a gitd "git diff"

abbr -a gitl "git log"

abbr -a git-config "git config --global -l"

abbr -a gitb "git branch "

abbr -a gitch "git checkout "
