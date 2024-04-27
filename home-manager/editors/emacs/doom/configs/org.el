;;; configs/org.el -*- lexical-binding: t; -*-

(setq org-directory "~/Documents/org")
(setq org-roam-directory "~/Documents/org/roam/")
(setq org-agenda-files '( "~/Documents/org/TODO/every-day.org"
                          "~/Documents/org/TODO/long-term.org"
                          "~/Documents/org/TODO/tracking-habit.org" ))
(setq org-noter-notes-search-path '("~/Documents/org/noter/"))
;; (setq org-journal-dir "~/Documents/org/journal/")

;; org notification
(require 'org-alert)
(setq alert-default-style 'libnotify)

;; hide special text (italic, bold)
(setq org-hide-emphasis-markers t)
(setq org-pretty-entities-include-sub-superscripts t)

;; When a TODO is set to a done state, record a timestamp
(setq org-log-done 'time)

;; Set up for journal
;; (setq org-journal-file-type 'yearly)

;; add mermaid to org-babel-load-languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((mermaid . t)
   (scheme . t)
   (rust . t)
   (C . t)
   (python . t)
   ))

;; enable fold when open new file
(setq org-startup-folded 'content)

;; kill frame when use noter
(setq org-noter-kill-frame-at-session-end nil)

;; set pdf-viewer
(defun my-org-setup ()
  (setq org-file-apps
        '((auto-mode . emacs)
          (directory . emacs)
          ("\\.mm\\'" . default)
          ("\\.x?html?\\'" . default)
          ("\\.pdf\\'" . "evince %s")))
  )
;; (add-hook 'buffer-list-update-hook 'my-org-setup)
(add-hook 'org-mode-hook 'my-org-setup)
