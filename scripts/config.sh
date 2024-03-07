# requirement step for zoxide
echo "zoxide init nushell | save -f ~/.zoxide.nu" >> ~/.config/nushell/env.nu

#requirement step for atuin
mkdir ~/.local/share/atuin/
atuin init nu | save ~/.local/share/atuin/init.nu


