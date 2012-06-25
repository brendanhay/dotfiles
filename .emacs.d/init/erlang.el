;; Erlang
(defvar erlang-dir "/usr/local/Cellar/erlang/R15B/")

(setq erlang-root-dir erlang-dir)
(setq exec-path (cons erlang-dir exec-path))

;; Make local packages known
(add-to-list 'load-path (concat package-dir "local/erlang"))

(require 'erlang-start)
;(require 'erlang-flymake)

;; Make those dirty -spec declarations less visible
(font-lock-add-keywords 'erlang-mode
                        '(("-spec\\(.+$\\)" 1 'zenburn-lowlight-2 prepend)))
