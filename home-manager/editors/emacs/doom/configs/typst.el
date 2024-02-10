;;; configs/typst.el -*- lexical-binding: t; -*-

;; add typst mode
(setq treesit-extra-load-path '("~/.config/emacs/tree-sitter"))
(setq typst-ts-mode-watch-options "--open")

;; format on save


;; (after! lsp-mode
;;   (add-to-list 'lsp-language-id-configuration
;;                '("\\.typ$" . "typst"))
;;
;;     (lsp-register-client
;;      (make-lsp-client :new-connection (lsp-stdio-connection "typst-lsp")
;;                       :activation-fn (lsp-activate-on "typst")
;;                       :server-id 'typst-lsp)))
;;
;; (add-hook 'typst-ts-mode-local-vars-hook #'lsp!)
;; (add-hook 'typst-ts-markup-mode-local-vars-hook #'lsp!)
;; (add-hook 'typst-ts--code-mode-local-vars-hook #'lsp!)
