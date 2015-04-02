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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2a86b339554590eb681ecf866b64ce4814d58e6d093966b1bf5a184acf78874d" default)))
 '(haskell-font-lock-symbols nil)
 '(haskell-indent-after-keywords
   (quote
    (("where" 2 0)
     ("of" 4)
     ("do" 4)
     ("in" 4 0)
     ("{" 2)
     "if" "then" "else" "let")))
 '(haskell-indent-thenelse 4)
 '(haskell-notify-p t)
 '(haskell-process-log t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(line-move-ignore-invisible nil))

;; Theme
(when (display-graphic-p)
  (load-theme 'base16-monokai)
  (set-background-color "#090909")
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(helm-candidate-number ((t (:foreground "LightSkyBlue2"))))
   '(helm-ff-directory ((t (:foreground "LightSkyBlue2" :weight bold))))
   '(helm-ff-dotted-directory ((t (:foreground "#ae81ff"))))
   '(helm-ff-executable ((t (:foreground "yellowgreen" :weight bold))))
   '(helm-ff-file ((t (:foreground "white"))))
   '(helm-ff-symlink ((t (:foreground "light slate gray" :weight bold))))
   '(helm-grep-file ((t (:foreground "LightSkyBlue2"))))
   '(helm-grep-finish ((t (:foreground "yellowgreen"))))
   '(helm-grep-lineno ((t (:foreground "grey20"))))
   '(helm-grep-match ((t (:foreground "#f92672"))))
   '(helm-match ((t (:foreground "grey40"))))
   '(helm-selection ((t (:background "#050505" :foreground "#f92672" :weight bold))))
   '(helm-source-header ((t (:foreground "yellow green" :weight bold :height 1.2 :family "Sans Serif"))))
   '(helm-visible-mark ((t (:foreground "dark slate gray"))))
   '(fringe ((t (:background "#090909"))))
   '(linum ((t (:background "#050505" :foreground "grey20"))))
   '(mode-line ((t (:background "grey10" :foreground "#f5f4f1"))))
   '(mode-line-inactive ((t (:inherit mode-line :background "grey5" :foreground "grey80" :box (:line-width -1 :color "grey30") :weight light))))
   '(vertical-border ((nil (:foreground "#050505"))))))
