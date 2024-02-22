;;; configs/eighty-column-rule.el -*- lexical-binding: t; -*-

;; source: https://emacs.stackexchange.com/questions/147/how-can-i-get-a-ruler-at-column-80
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
