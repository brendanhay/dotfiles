;; Directories
(defvar tmp-dir "~/tmp/")
(defvar emacs-dir "~/.emacs.d/")

;; Packages
(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

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
    ("2a86b339554590eb681ecf866b64ce4814d58e6d093966b1bf5a184acf78874d" ;; base16-monokai
     default)))
 '(global-linum-mode t)
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
(load-theme 'base16-monokai)
(set-background-color "#101010")

;; Custom Faces
(custom-set-faces
 '(fringe ((t (:background "#101010"))))
 '(linum ((t (:background "#0c0c0c" :foreground "grey20"))))
 '(mode-line ((t (:background "grey30" :foreground "#f5f4f1"))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#0c0c0c" :foreground "grey80" :box (:line-width -1 :color "grey10") :weight light))))
 '(vertical-border ((nil (:foreground "#101010")))))
