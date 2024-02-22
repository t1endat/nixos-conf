;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "tiendat"
      user-mail-address "tiendatlework@gmail.com")

(setq doom-font (font-spec :family "Intel One Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "Intel One Mono" :height 1.3)
      doom-symbol-font (font-spec :family "Intel One Mono")
      doom-big-font (font-spec :family "Intel One Mono" :size 22))

(setq doom-theme 'catppuccin)


;; load other configs
(mapc 'load (file-expand-wildcards "~/.config/doom/configs/*.el"))

;; make sure installed packages
;; (unless (package-installed-p 'nerd-icons)
;;   (package-install 'nerd-icons))

;; default path
(setq projectile-project-search-path '("~/Documents/"))
(setq delete-by-moving-to-trash t
      trash-directory "~/.local/share/Trash/files/")
(setq doom-user-dir "~/Documents/nix-dev/nixos-conf/home-manager/editors/emacs/doom/")

;; disable mouse
(require 'disable-mouse)
(global-disable-mouse-mode)
(mapc #'disable-mouse-in-keymap
      (list evil-motion-state-map
            evil-normal-state-map
            evil-visual-state-map
            evil-insert-state-map))

;; default settings
(beacon-mode 1)
(setq hl-todo-mode t)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq default-input-method "vietnamese-telex")
(setq scroll-margin 5)
(setq projectile-indexing-method 'alien)
(setq display-line-numbers-type 'relative)
(setq tramp-default-method "ssh")

