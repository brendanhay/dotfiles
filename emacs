;; Directories
(defvar tmp-dir "~/tmp/")
(defvar emacs-dir "~/.emacs.d/")

;; Packages
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

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
    ("0240d45644b370b0518e8407f5990a243c769fb0150a7e74297e6f7052a04a72" default)))
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
 '(haskell-notify-p t)
 '(haskell-process-log t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(line-move-ignore-invisible nil)
 '(tags-case-fold-search nil))

;; Theme
(when (display-graphic-p)
  (load-theme 'base16-monokai-dark)
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


(defun mo–toggle–identifier–naming–style ()
  "Toggles the symbol at point between C-style naming,
e.g. `hello_world_string', and camel case,
e.g. `HelloWorldString'."
  (interactive)
  (let* ((symbol–pos (bounds–of–thing–at–point 'symbol))
         case–fold–search symbol–at–point cstyle regexp func)
    (unless symbol–pos
      (error "No symbol at point"))
    (save–excursion
      (narrow–to–region (car symbol–pos) (cdr symbol–pos))
      (setq cstyle (string–match–p "_" (buffer–string))
            regexp (if cstyle "\\(?:\\_<\\|_\\)\\(\\w\\)" "\\([A-Z]\\)")
            func (if cstyle
                     'capitalize
                   (lambda (s)
                     (concat (if (= (match–beginning 1)
                                    (car symbol–pos))
                                 ""
                               "-")
                             (downcase s)))))
      (goto–char (point–min))
      (while (re–search–forward regexp nil t)
        (replace–match (funcall func (match–string 1))
                       t nil))
      (widen))))
