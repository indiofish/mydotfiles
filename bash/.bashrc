# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
*) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100
HISTFILESIZE=200

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  screen-256color | xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ <\1>/'
}
function dir_chomp () {
  local IFS=/ c=1 n d
  local p=(${1/#$HOME/\~}) r=${p[*]}
  local s=${#r}
  while ((s>$2&&c<${#p[*]}-1))
  do
    d=${p[c]}
    n=2;
    #[[ $d = .* ]]&&n=2
    if test ${#d} -gt $n 
    then
      #append + if shortened
      p[c++]=${d:0:n}'+'
    else
      p[c++]=${d:0:n}
    fi
    ((s-=${#d}-n))
  done
  echo "${p[*]}"
}
function mydir {
  echo $(dir_chomp "$PWD" 0)
}
#PROMPT_DIRTRIM=3
if [ "$color_prompt" = yes ]; then
  #PS1='\[\e[0;36m\]\u@\H\[\e[m\] \[\e[0;35m\]$(dir_chomp "$PWD" 0)\[\e[38;5;11m\]$(parse_git_branch) \[\e[0;34m\]\$\[\e[m\] \[\e[0;37m\]'
  PS1='\[\e[7m\e[38;5;247m\] $(dir_chomp "$PWD" 0) \\
\[\e[27m\e[38;5;247m\]$(parse_git_branch) \\
\[\e[38;5;161m\]>\[\e[m\] \[\e[0;37m\]'
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
trap 'printf "\e[0m" "$_"' DEBUG

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*|screen-256color)
    #PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls -FX --color=always '
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias list='ls -XA --color=always | less -ieMXSRJ '

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
source $HOME/.simple_bash_compl_tmux.sh 
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.opam/4.02.3/bin"
export PATH="$PATH:$HOME/workspace/opt/tizen-toolchain-4.9~git-i686_armv7l-tizen-linux-gnueabi-20151113/bin"
#export PATH="$PATH:$HOME/.local/bin/vim74/bin"
export OCAML_LD_LIBRARY_PATH="$HOME/.opam/4.02.3/lib/stublibs"
export LS_COLORS
