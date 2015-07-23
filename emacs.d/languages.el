;;
;; Haskell
;;

(defvar haskell-mode-extra-keywords
  '(("\\<\\(FIXME\\):" 1 font-lock-warning-face prepend)
    ("^\\([a-zA-Z_]+[a-zA-Z0-9_]*\\) :" 1 font-lock-preprocessor-face prepend)))

;; Add Extra Highlights
(font-lock-add-keywords 'haskell-mode haskell-mode-extra-keywords)

(require 'haskell-align-imports)

;; Haskell main editing mode key bindings.
(defun haskell-hook ()
  (define-key haskell-mode-map (kbd "<return>") 'haskell-simple-indent-newline-same-col)
  (define-key haskell-mode-map (kbd "C-<return>") 'haskell-simple-indent-newline-indent)

  ;; Load the current file (and make a session if not already made).
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
  (define-key haskell-mode-map [f5] 'haskell-process-load-file)

  ;; Switch to the REPL.
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)

  ;; “Bring” the REPL, hiding all other windows apart from the source
  ;; and the REPL.
  (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)

  (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)

  ;; Get the type and info of the symbol at point, print it in the
  ;; message buffer.
  (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)

  ;; Contextually do clever things on the space key, in particular:
  ;; 1. Complete imports, letting you choose the module name.
  ;; 2. Show the type of the symbol after the space.
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

  ;; Jump to the imports. Keep tapping to jump between import
  ;; groups. C-u <key> to jump back again.
  (define-key haskell-mode-map (kbd "C-c i") 'haskell-navigate-imports)

  ;; Searches
  (define-key haskell-mode-map (kbd "C-c h") 'haskell-hoogle)
  (define-key haskell-mode-map (kbd "C-c C-h") 'haskell-hayoo)

  ;; Jump to the definition of the current symbol.
  (define-key haskell-mode-map (kbd "M-\"") 'haskell-process-generate-tags)
  (define-key haskell-mode-map (kbd "M-'") 'haskell-mode-tag-find))

(add-hook 'haskell-mode-hook 'haskell-hook)
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(remove-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (remove-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;;
;; Lisp
;;

(setq auto-mode-alist
  (append auto-mode-alist
    '(("emacs$" . lisp-mode))))

;;
;; Ruby
;;

(setq auto-mode-alist
  (append auto-mode-alist
    '(("Rakefile$" . ruby-mode)
      ("Capfile$" . ruby-mode)
      ("Gemfile\\." . ruby-mode)
      ("Gemfile$" . ruby-mode)
      ("Cheffile\\." . ruby-mode)
      ("Cheffile$" . ruby-mode)
      ("Vagrantfile$" . ruby-mode)
      ("Thorfile$" . ruby-mode)
      (".gemspec$" . ruby-mode)
      (".erb$" . ruby-mode))))

;;
;; Erlang
;;

(add-hook 'erlang-mode-hook
          (lambda ()
            (setq inferior-erlang-machine-options '("-sname" "emacs"))))

(setq auto-mode-alist
  (append auto-mode-alist
    '(("\\.rel$"      . erlang-mode)
      ("\\.app$"      . erlang-mode)
      ("\\.appSrc$"   . erlang-mode)
      ("\\.app.src$"  . erlang-mode)
      ("rebar.config" . erlang-mode)
      ("sys.config"   . erlang-mode)
      ("app.config"   . erlang-mode)
      ("Emakefile"    . erlang-mode)
      ("\\.hrl$"      . erlang-mode)
      ("\\.erl$"      . erlang-mode)
      ("\\.yrl$"      . erlang-mode))))

;;
;; Markdown
;;

(setq markdown-command-needs-filename 1)

(setq auto-mode-alist
  (append auto-mode-alist
    '(("\\.md$" . markdown-mode)
      ("\\.markdown$" . markdown-mode)
      ("\\.mdown$" . markdown-mode))))

;;
;; ED-E
;;

(setq auto-mode-alist
  (append auto-mode-alist
    '(("\\.ede$" . jinja2-mode))))

