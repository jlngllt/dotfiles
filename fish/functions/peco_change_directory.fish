function _peco_change_directory
  if [ (count $argv) ]
    peco --layout=bottom-up --query "$argv "|perl -pe 's/([ ()])/\\\\$1/g'|read foo
  else
    peco --layout=bottom-up |perl -pe 's/([ ()])/\\\\$1/g'|read foo
  end
  if [ $foo ]
    builtin cd $foo
    commandline -r ''
    commandline -f repaint
  else
    commandline ''
  end
end

function peco_change_directory
  begin
    echo $HOME/.config
    ghq list -p
		find . -mindepth 1 -maxdepth 1 -type d | grep -v \.git
		find $HOME/dev/ -mindepth 1 -type d | grep -v \.git
		# ls -ad */ |perl -pe "s#^#$PWD/#"|grep -v \.git
		# ls -ad $HOME/dev/*/* |grep -v \.git
  end | sed -e 's/\/$//' | awk '!a[$0]++' | _peco_change_directory $argv
end
