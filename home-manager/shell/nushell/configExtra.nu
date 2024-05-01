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
alias v = nvim
alias j = joshuto
alias e = exit
alias y = yazi
alias tp = trash-put
alias bt = blueman-manager  
alias lt = exa -l -T
alias wifi = nmtui

# switch for home-manager and nixos
let user = $env.HOME | path basename
let host = if $user == "icslab" { "dell-pc" } else { "lenovo-laptop" }

# home-manager swith
def hs [] {
  cd ~/Documents/nix-dev/nixos-conf/; 
  home-manager switch --flake .#$user
}

# nixos swith
def ns [] {
  cd ~/Documents/nix-dev/nixos-conf/; 
  sudo nixos-rebuild switch --flake .#$host
}

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
