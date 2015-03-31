(defvar tmp-dir   "~/tmp/")
(defvar emacs-dir "~/.emacs.d/")

;;
;; Packages
;;

(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa.milkbox.net/packages/")))


;;
;; Generic
;;

;; Remove Visual Elements
(menu-bar-mode -1)

;; GUI Only
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Default mode
(setq default-major-mode 'text-mode)

;; Keyboard
(set-keyboard-coding-system nil)

;; Kill startup message
(setq inhibit-startup-message t)

;; Replace Yes with Y (or N)
(fset 'yes-or-no-p 'y-or-n-p)

;; Line wrap
(set-default 'truncate-lines t)

;; Cua
(cua-mode 0)

;; Startup
(setq inhibit-startup-message t)

;;
;; Bookmarks
;;

(setq bookmark-save-flag 1
      bookmark-default-file (concat emacs-dir "bookmarks"))


;;
;; Initialise
;;

(add-hook 'after-init-hook
          (lambda ()
            (load (concat emacs-dir "settings.el"))
            (load (concat emacs-dir "functions.el"))
            (load (concat emacs-dir "keys.el"))
            (load (concat emacs-dir "languages.el"))))

;;
;; Overrides
;;

(add-hook 'window-configuration-change-hook
          (lambda ()
            (set-window-margins (car (get-buffer-window-list (current-buffer) nil t)) 0 0)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5585c45a64a80a2f0443090a5aad04f1b097f38188b829ad70bdd46a9939847e" "2a86b339554590eb681ecf866b64ce4814d58e6d093966b1bf5a184acf78874d" "0ed983facae99849805b2f7be926561cb58474eb18e5296d9bb3ad7f9b088a5b" default)))
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
 '(line-move-ignore-invisible nil)
 '(linum-format "%3d "))

(load-theme 'base16-monokai)
(set-background-color "#101010")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "#101010"))))
 '(linum ((t (:background "#0c0c0c" :foreground "grey20"))))
 '(mode-line ((t (:background "grey30" :foreground "#f5f4f1"))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#0c0c0c" :foreground "grey80" :box (:line-width -1 :color "grey10") :weight light))))
 '(vertical-border ((nil (:foreground "#101010")))))

;;
;; Server
;;

(load "server")

(unless (server-running-p)
        (server-start))
