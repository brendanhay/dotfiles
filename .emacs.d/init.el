;; Directories
(setq emacs-dir "~/.emacs.d/"
      temp-dir (concat emacs-dir "temp/")
      module-dir (concat emacs-dir "modules/")
      package-dir (concat emacs-dir "packages/")
      initialiser-dir (concat emacs-dir "initialisers/"))

;; Configuration modules
(add-to-list 'load-path module-dir)

(require 'bindings)
(require 'settings)

;; 3rd party packages
(when (file-exists-p package-dir)
  (mapc '(lambda (file) (load-library (concat package-dir file)))
        (directory-files package-dir nil "^[^#].*el$")))

;; Package initialisers
(when (file-exists-p initialiser-dir)
  (mapc '(lambda (file) (load (concat initialiser-dir file)))
        (directory-files initialiser-dir nil "^[^#].*el$")))
