;; Directories
(defvar tmp-dir "~/tmp/")
(defvar emacs-dir "~/.emacs.d/")

;; Packages
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;; Initialise
(add-hook 'after-init-hook
          (lambda ()
            (load (concat emacs-dir "settings.el"))
            (load (concat emacs-dir "functions.el"))
            (load (concat emacs-dir "keys.el"))
            (load (concat emacs-dir "languages.el"))))

;; Custom Variables
(custom-set-variables
 '(custom-safe-themes
   (quote
    ("2a86b339554590eb681ecf866b64ce4814d58e6d093966b1bf5a184acf78874d" default)))
 '(line-move-ignore-invisible nil))

;; Theme
(when (display-graphic-p)
  (load-theme 'base16-monokai)
  (set-background-color "#090909")
  (custom-set-faces
   '(fringe ((t (:background "#090909"))))
   '(helm-candidate-number ((t (:foreground "LightSkyBlue2"))))
   '(helm-ff-directory ((t (:foreground "LightSkyBlue2" :weight bold))))
   '(helm-ff-dotted-directory ((t (:foreground "LightSkyBlue2" :weight bold))))
   '(helm-ff-executable ((t (:foreground "yellowgreen"))))
   '(helm-ff-file ((t (:foreground "white"))))
   '(helm-match ((t (:foreground "grey40"))))
   '(helm-selection ((t (:background "#000000" :foreground "#f92672" :weight bold))))
   '(helm-source-header ((t (:foreground "yellow green" :weight bold :family "Sans Serif"))))
   '(helm-visible-mark ((t (:foreground "dark slate gray"))))
   '(linum ((t (:background "#000000" :foreground "grey20"))))
   '(mode-line ((t (:background "grey20" :foreground "#f5f4f1"))))
   '(mode-line-inactive ((t (:inherit mode-line :background "#000000" :foreground "grey80" :box (:line-width -1 :color "grey10") :weight light))))
   '(vertical-border ((nil (:foreground "#090909"))))))
