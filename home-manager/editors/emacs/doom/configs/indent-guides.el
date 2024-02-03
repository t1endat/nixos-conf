;;; configs/indent-guides.el -*- lexical-binding: t; -*-

;; indent-guides
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'text-mode-hook 'highlight-indent-guides-mode)
(require 'highlight-indent-guides)
(setq highlight-indent-guides-method 'column)
(setq highlight-indent-guides-auto-enabled nil)

(set-face-background 'highlight-indent-guides-odd-face "darkgray")
(set-face-background 'highlight-indent-guides-even-face "dimgray")
(set-face-foreground 'highlight-indent-guides-character-face "dimgray")
