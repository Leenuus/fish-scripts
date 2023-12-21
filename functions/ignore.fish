function ignore
if test -d ./.git
$EDITOR .gitignore
else
echo "It is not root dir of a git repo"
end
end
