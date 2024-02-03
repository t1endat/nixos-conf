;;; configs/org-ai.el -*- lexical-binding: t; -*-

(use-package org-ai
  :ensure t
  :commands (org-ai-mode
             org-ai-global-mode)
  :init
  (add-hook 'org-mode-hook #'org-ai-mode) ; enable org-ai in org-mode
  (org-ai-global-mode) ; installs global keybindings on C-c M-a
  ) ; if you are using yasnippet and want `ai` snippets

(setq auth-sources '("~/Documents/private-conf/chatgpt/authinfo.gpg"))
