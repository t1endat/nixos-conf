#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# Define Editor
export EDITOR=nvim

eval "$(starship init bash)"

if command -v nu &> /dev/null; then 
  exec nu 
fi

