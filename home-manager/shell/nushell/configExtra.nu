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
$env.PATH = ($env.PATH | split row (char esep) | append "~/.cargo/bin")

# zoxide
source ~/.zoxide.nu

# zellij
def start_zellij [] {
  if 'ZELLIJ' not-in ($env | columns) {
    if 'ZELLIJ_AUTO_ATTACH' in ($env | columns) and $env.ZELLIJ_AUTO_ATTACH == 'true' {
      zellij attach -c
    } else {
      zellij
    }

    if 'ZELLIJ_AUTO_EXIT' in ($env | columns) and $env.ZELLIJ_AUTO_EXIT == 'true' {
      exit
    }
  }
}

start_zellij

# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------

alias l = ls
alias c = clear
alias h = hx
# alias v = nvim
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
alias gcheck = git checkout
