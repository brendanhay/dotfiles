(load (concat package-dir "rinari/rinari.el"))

(require 'rinari)
(setq rinari-tags-file-name "TAGS")
(setq ruby-insert-encoding-magic-comment nil)

(setq auto-mode-alist
      (append
       '(("\\Gemfile\\'" . ruby-mode))
       '(("\\Guardfile\\'" . ruby-mode))
       '(("\\Rakefile\\'" . ruby-mode))
       '(("\\.rb\\'" . ruby-mode))
       '(("\\.thor\\'" . ruby-mode))
       '(("\\.rake\\'" . ruby-mode))
       auto-mode-alist))
