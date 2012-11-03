(defvar emacs-dir   "~/.emacs.d/")
(defvar package-dir (concat emacs-dir "pkg/"))
(defvar temp-dir    "~/tmp/")
(defvar init-dir    (concat emacs-dir "init/"))
(defvar theme-dir   (concat emacs-dir "theme/"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3a3a3a" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :foundry "default" :family "default"))))
 '(flymake-errline ((t (:background "#303030"))) t)
 '(flymake-warnline ((t (:background "#363636"))) t)
 '(linum ((nil :background "#40404" :foreground "#444")))
 '(minibuffer-prompt ((t (:background "#333" :foreground "#f0dfaf"))))
 '(mode-line ((t (:background "#222" :foreground "#f0dfaf"))))
 '(mode-line-inactive ((t (:background "#40404" :foreground "#888" :weight light))))
 '(vertical-border ((nil (:foreground "#3f3f3f"))))
 '(whitespace-line ((t (:background "black" :foreground "violet"))))
 '(whitespace-tab ((t (:background "black" :foreground "violet"))))
 '(whitespace-trailing ((t (:background "black" :foreground "violet" :weight bold)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("b0950b032aa3c8faab4864ae288296dd66b92eca" "ea02295fa91165fe98e4eef5162b8dfde7170f68" "6a848433c6599bf0c8cf46357c3b3fab664d7d56" "6c626c8c4a13257e67e0a4453e6dbbd1aa217bf6" "91929dce9e377ea34929d8167a63e21f68e11196" "4b75b39bf4fba6fdbdecf46b752fccf5cd742a6b" "b3e3fe1aa0852d9d7124d09625a11e13a0f7cdf8" "eeedc5b7b0432de166426011130e7584be4ac1ed" "c173dd4604327028f39b46d6eebfa5f5c1fbd794" "ec27c369651b81d62d59f37bbb1d6a9ef860a446" "e7560395414fa4e753cea89bee3be74106b43d6c" "2e900141a81d02e9e5b64572385c9d3aef835904" "f86a0c58c789e855587364eecb15371dc5b4ae0c" "343b21b4c9c0edb6434412062a187bfcb1ed2d75" "9cdf9fb94f560902b567b73f65c2ed4e5cfbaafe" default)))
 '(global-linum-mode t)
 '(haskell-indent-after-keywords (quote (("where" 2 0) ("of" 4) ("do" 4) ("in" 4 0) ("{" 2) "if" "then" "else" "let")))
 '(haskell-indent-thenelse 1)
 '(haskell-literate-default (quote bird)))

(load (concat emacs-dir "settings.el"))
(load (concat emacs-dir "functions.el"))
(load (concat emacs-dir "keys.el"))
