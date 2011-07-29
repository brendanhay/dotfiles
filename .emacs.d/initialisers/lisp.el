(require 'lisp-mode)

(setq auto-mode-alist
      (append
       '(("\\.cl\\'" . lisp-mode))
       '(("\\.clj\\'" . lisp-mode))
       '(("\\.lisp\\'" . lisp-mode))
       '(("\\.el\\'" . emacs-lisp-mode))
       auto-mode-alist))

