;;; configs/typst.el -*- lexical-binding: t; -*-

;; add typst mode
(setq treesit-extra-load-path '("~/.config/emacs/tree-sitter"))
(setq typst-ts-mode-watch-options "--open")

;; apply grammar and flyspell
(add-hook 'typst-ts-mode-hook 'flyspell-mode)
