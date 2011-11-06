(defvar erlang-dir "/usr/local/Cellar/erlang/R14B03/")

(setq erlang-root-dir erlang-dir)
(setq exec-path (cons erlang-dir exec-path))

(setq load-path (cons (concat emacs-dir "erlang") load-path))

(require 'erlang-start)
(require 'erlang-flymake)
