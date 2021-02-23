function export
    if [ $argv ]
        set var (echo $argv | cut -f1 -d=)
        set val (echo $argv | cut -f2 -d=)
        set -g -x $var $val
    else
        echo 'export var=value'
    end
end

# aliases
alias pip=pip3

# make file python executable
alias mpy="/home/sampled/scripts/mpy.sh"

# view i3 docs in terminal
alias i3doc="w3m -dump ~/.i3_userguide.html | less"

#alias for google drive and keep
alias keep="qutebrowser https://keep.google.com/ &"
alias drive="qutebrowser https://drive.google.com/drive/my-drive &"

set -x SHELL /bin/bash


export PATH="/home/sampled/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/sampled/.dotnet/tools:/home/sampled/scripts:/home/sampled/.cargo/bin"

alias vim=nvim

export XDG_CONFIG_HOME=/home/sampled/.config

alias py=python3

export PAGER=/usr/bin/less # setting less to default pager

alias cat=batcat

# allow for sudo !! (sudo last command)
function sudo --description 'Run command using sudo (use !! for last command)'
      if test (count $argv) -gt 0
          switch $argv[1]
              case '!!'
                  if test (count $argv) -gt 1
                      set cmd "command sudo $history[1] $argv[2..-1]"
                  else
                      set cmd "command sudo $history[1]"
                  end
              case '*'
                  set cmd "command sudo $argv"
          end
      else
          set cmd "command sudo fish"
      end
      eval $cmd
  end


# compile md
function md
	pandoc -f markdown "$argv.md" -t latex -o "$argv.pdf"
end

# always run docker with sudo
alias dok="sudo docker"

# init starfish
starship init fish | source
