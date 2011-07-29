(require 'erlang)

(setq auto-mode-alist 
      (cons '("\\.hrl$" . erlang-mode) (cons '("\\.erl$" . erlang-mode) auto-mode-alist)))

