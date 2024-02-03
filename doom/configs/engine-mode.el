;;; configs/engine-mode.el -*- lexical-binding: t; -*-

(engine-mode t)

;; frequently sites
(defengine duckduckgo
  "https://duckduckgo.com/?q=%s")

(defengine zalo
  "https://chat.zalo.me/")

(defengine bard
  "https://bard.google.com/")

;; documentations
(defengine rust-docs
  "https://doc.rust-lang.org/std/index.html?search=%s")

(defengine rust-releases
  "https://docs.rs/releases/search?query=%s")

(defengine cpp-docs
  "https://duckduckgo.com/?sites=cppreference.com&q=%s&atb=v410-1&ia=web")

(defengine python-docs
  "https://docs.python.org/3/search.html?q=%s")

;; other searchs
(defengine youtube
  "https://www.youtube.com/results?aq=f&oq=&search_query=%s")

(defengine github
  "https://github.com/search?ref=simplesearch&q=%s")

(defengine reddit
  "https://www.reddit.com/search/?q=%s")

(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s")

(defengine wikipedia
  "https://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :docstring "Searchin' the wikis."
  :browser 'eww-browse-url
  )


;; Not use yet
;; (defengine google
;;   "https://www.google.com/search?ie=utf-8&oe=utf-8&q=%s")

;; (defengine google-images
;;   "https://www.google.com/images?hl=en&source=hp&biw=1440&bih=795&gbv=2&aq=f&aqi=&aql=&oq=&q=%s")

;; (defengine google-maps
;;   "https://maps.google.com/maps?q=%s"
;;   :docstring "Mappin' it up.")

;; (defengine project-gutenberg
;;   "https://www.gutenberg.org/ebooks/search/?query=%s")

;; (defengine twitter
;;   "https://twitter.com/search?q=%s")

;; (defengine wiktionary
;;   "https://www.wikipedia.org/search-redirect.php?family=wiktionary&language=en&go=Go&search=%s")

;; (defengine wolfram-alpha
;;   "https://www.wolframalpha.com/input/?i=%s")
