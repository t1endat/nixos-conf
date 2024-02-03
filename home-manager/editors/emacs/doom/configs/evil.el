;;; configs/evil.el -*- lexical-binding: t; -*-

(evil-global-set-key 'insert (kbd "C-e") 'evil-delete-backward-char)

;; Match the word under cursor (i.e. make it an edit region). Consecutive presses will
;; incrementally add the next unmatched match.
(define-key evil-normal-state-map (kbd "M-m") 'evil-multiedit-match-and-next)
;; Match selected region.
(define-key evil-visual-state-map (kbd "M-m") 'evil-multiedit-match-and-next)
;; Insert marker at point
(define-key evil-insert-state-map (kbd "M-m") 'evil-multiedit-toggle-marker-here)

;; Same as M-d but in reverse.
(define-key evil-normal-state-map (kbd "M-M") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "M-M") 'evil-multiedit-match-and-prev)

;; go to marked position
;; (define-key evil-normal-state-map "'" 'evil-goto-mark)
;; (define-key evil-visual-state-map "'" 'evil-goto-mark)
