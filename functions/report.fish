function report --description "test a program with a reminder text before it"
  set_color blue
  echo -e $argv[2]
  set_color normal
  fish -c "$argv[1]"
  echo
end
