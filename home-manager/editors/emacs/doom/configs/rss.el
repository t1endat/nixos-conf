;;; configs/rss.el -*- lexical-binding: t; -*-

;; some config of rss
(after! elfeed
  ;; (setq elfeed-search-filter "@2-year-ago +unread"))
  (setq elfeed-search-filter "@2-year-ago"))
(add-hook! 'elfeed-search-mode-hook #'elfeed-update)
(setq elfeed-goodies/entry-pane-size 0.5)

(use-package! elfeed
  :config
  ;; add more custom
  (defun concatenate-authors (authors-list)
    "Given AUTHORS-LIST, list of plists; return string of all authors concatenated."
    (if (> (length authors-list) 1)
        (format "%s et al." (plist-get (nth 0 authors-list) :name))
      (plist-get (nth 0 authors-list) :name)))

  (defun my-search-print-fn (entry)
    "Print ENTRY to the buffer."
    (let* ((date (elfeed-search-format-date (elfeed-entry-date entry)))
           (title (or (elfeed-meta entry :title)
                      (elfeed-entry-title entry) ""))
           (title-faces (elfeed-search--faces (elfeed-entry-tags entry)))
           (entry-authors (concatenate-authors
                           (elfeed-meta entry :authors)))
           (title-width (- (window-width) 10
                           elfeed-search-trailing-width))
           (title-column (elfeed-format-column
                          title 100
                          :left))
           (entry-score (elfeed-format-column (number-to-string (elfeed-score-scoring-get-score-from-entry entry)) 10 :left))
           (authors-column (elfeed-format-column entry-authors 40 :left)))
      (insert (propertize date 'face 'elfeed-search-date-face) " ")

      (insert (propertize title-column
                          'face title-faces 'kbd-help title) " ")
      (insert (propertize authors-column
                          'kbd-help entry-authors) " ")
      (insert entry-score " ")))
  )

(setq elfeed-search-print-entry-function #'my-search-print-fn)
(setq elfeed-search-date-format '("%y-%m-%d" 10 :left))
(setq elfeed-search-title-max-width 110)


(use-package! elfeed-score
  :after elfeed
  :config
  ;; (elfeed-score-load-score-file "~/Documents/org/elfeed.score") ; See the elfeed-score documentation for the score file syntax
  (elfeed-score-load-score-file "~/.config/doom/elfeed.score") ; See the elfeed-score documentation for the score file syntax
  (elfeed-score-enable)
  (define-key elfeed-search-mode-map "=" elfeed-score-map))
