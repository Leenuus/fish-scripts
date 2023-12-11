function http-server
	set options $options (fish_opt -s p -l port -r)
	set options $options (fish_opt -s d -l path -o)
	set options $options (fish_opt -s a -l address -r)
	argparse $options -- $argv
	if test -z $_flag_path
		set _flag_path .
	end
	if test -z $_flag_port
		if test -z $argv[1]
			set _flag_port 8888
		else
			set _flag_port $argv[1]
		end
	end
	if test -z $_flag_a
		set _flag_a 127.0.0.1
	end
	python -m http.server -b "$_flag_a" -d "$_flag_path" "$_flag_port"
end
