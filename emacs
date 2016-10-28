;; Directories
(defvar tmp-dir "~/tmp/")
(defvar emacs-dir "~/.emacs.d/")

;; Packages
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

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
    ("c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "3fd0fda6c3842e59f3a307d01f105cce74e1981c6670bb17588557b4cebfe1a7" "03e3e79fb2b344e41a7df897818b7969ca51a15a67dc0c30ebbdeb9ea2cd4492" "0240d45644b370b0518e8407f5990a243c769fb0150a7e74297e6f7052a04a72" default)))
 '(font-use-system-font t)
 '(grep-command "grep -I")
 '(haskell-indent-after-keywords
   (quote
    (("where" 2 0)
     ("of" 4)
     ("do" 4)
     ("in" 4 0)
     ("{" 2)
     "if" "then" "else" "let")))
 '(haskell-indent-thenelse 4)
 '(haskell-indentation-ifte-offset 4)
 '(haskell-notify-p t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save nil)
 '(line-move-ignore-invisible nil)
 '(package-selected-packages
   (quote
    (yaml-mode workgroups2 tuareg string-inflection sml-mode scss-mode sass-mode rustfmt python-mode pos-tip markdown-toc markdown-preview-mode markdown-mode+ jinja2-mode jekyll-modes idris-mode hyde helm-projectile helm-flycheck haskell-mode go-mode gh-md flycheck-color-mode-line fill-column-indicator dockerfile-mode clang-format cargo button-lock auctex)))
 '(purescript-indent-spaces 4)
 '(purescript-indentation-ifte-offset 4)
 '(purescript-indentation-layout-offset 4)
 '(purescript-indentation-left-offset 4)
 '(purescript-indentation-where-pre-offset 2)
 '(purescript-mode-hook (quote (haskell-indentation-mode)))
 '(sgml-basic-offset 2)
 '(tags-case-fold-search nil))

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
   '(helm-ff-executable ((t (:foreground "YellowGreen" :weight bold))))
   '(helm-ff-file ((t (:foreground "White"))))
   '(helm-ff-symlink ((t (:foreground "DightSlateGray" :weight bold))))
   '(helm-grep-file ((t (:foreground "LightSkyBlue2"))))
   '(helm-grep-finish ((t (:foreground "YellowGreen"))))
   '(helm-grep-lineno ((t (:foreground "Grey20"))))
   '(helm-grep-match ((t (:foreground "#f92672"))))
   '(helm-match ((t (:foreground "Grey40"))))
   '(helm-selection ((t (:background "#050505" :foreground "#f92672" :weight bold))))
   '(helm-source-header ((t (:foreground "YellowGreen" :weight bold :height 1.1 :family "Sans Serif"))))
   '(helm-visible-mark ((t (:foreground "DarkSlateGray"))))
   '(fringe ((t (:background "#090909"))))
   '(linum ((t (:background "#050505" :foreground "Grey30"))))
   '(mode-line ((t (:background "Grey10" :foreground "#f5f4f1" :box (:line-width -1 :color "Grey20")))))
   '(mode-line-inactive ((t (:background "#050505" :foreground "Grey45" :weight light))))
   '(vertical-border ((nil (:foreground "#050505"))))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "#090909"))))
 '(helm-candidate-number ((t (:foreground "LightSkyBlue2"))))
 '(helm-ff-directory ((t (:foreground "LightSkyBlue2" :weight bold))))
 '(helm-ff-dotted-directory ((t (:foreground "#ae81ff"))))
 '(helm-ff-executable ((t (:foreground "YellowGreen" :weight bold))))
 '(helm-ff-file ((t (:foreground "White"))))
 '(helm-ff-symlink ((t (:foreground "DightSlateGray" :weight bold))))
 '(helm-grep-file ((t (:foreground "LightSkyBlue2"))))
 '(helm-grep-finish ((t (:foreground "YellowGreen"))))
 '(helm-grep-lineno ((t (:foreground "Grey20"))))
 '(helm-grep-match ((t (:foreground "#f92672"))))
 '(helm-match ((t (:foreground "Grey40"))))
 '(helm-selection ((t (:background "#050505" :foreground "#f92672" :weight bold))))
 '(helm-source-header ((t (:foreground "YellowGreen" :weight bold :height 1.1 :family "Sans Serif"))))
 '(helm-visible-mark ((t (:foreground "DarkSlateGray"))))
 '(linum ((t (:background "#050505" :foreground "Grey30"))))
 '(mode-line ((t (:background "Grey10" :foreground "#f5f4f1" :box (:line-width -1 :color "Grey20")))))
 '(mode-line-inactive ((t (:background "#050505" :foreground "Grey45" :weight light))))
 '(vertical-border ((nil (:foreground "#050505")))))

(put 'downcase-region 'disabled nil)

