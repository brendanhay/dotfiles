(require 'ido)
(ido-mode t)

;; Vertical IDO Results
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

(defun ido-disable-line-trucation () 
  (set (make-local-variable 'truncate-lines) nil))

(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)
