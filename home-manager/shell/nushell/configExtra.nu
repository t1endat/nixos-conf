# -----------------------------------------------------
# ADD MORE CONFIG
# -----------------------------------------------------

# avoid use rm
alias rm = echo "This is not the command you are looking for."; false

# thefuck
alias fuck = with-env {TF_ALIAS: "fuck", PYTHONIOENCODING: "utf-8"} {
  thefuck (history | last 1 | get command.0)
}

# atuin
$env.config = {
    show_banner: false
    keybindings: []
}
source ~/.local/share/atuin/init.nu

# add to PATH
$env.PATH = ($env.PATH | split row (char esep) | append "~/.config/emacs/bin" | append "~/.cargo/bin")

# zoxide
source ~/.zoxide.nu

# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------

alias l = ls
alias c = clear
# alias v = nvim
alias h = hx
alias e = exit
alias y = yazi
alias tp = trash-put
alias bt = blueman-manager  
alias lt = exa -l -T
alias wifi = nmtui

# -----------------------------------------------------
# GIT
# -----------------------------------------------------

alias gs = git status
alias ga = git add
alias gc = git commit -m
alias gp = git push
alias gpl = git pull
alias gst = git stash
# alias gsp = git stash; git pull
alias gcheck = git checkout
