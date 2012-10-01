;; Packages
(setq package-user-dir (concat package-dir "remote/"))

(when (load (expand-file-name (concat package-dir "local/package.el")))
  (package-initialize))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Make local packages known
(add-to-list 'load-path (concat package-dir "local"))

;; Load local initializers
(mapcar
 (lambda (file) (load (concat init-dir file)))
 (directory-files init-dir nil ".el$"))

;; Initial directory
(setq default-directory "~/")

;; Backups
(setq backup-directory-alist `((".*" . ,temp-dir)))
(setq auto-save-file-name-transforms `((".*" ,temp-dir t)))

;; Show columns
(setq column-number-mode 1)

;; Fill columns
(require 'fill-column-indicator)
(setq fci-rule-color "gray20")
(setq fci-always-use-textual-rule t)
(setq fci-rule-width 10)

(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda () (setq fill-column 80) (fci-mode 1)))

(global-fci-mode 1)

;; Soft tabs
(setq-default indent-tabs-mode nil)

;; Show whitespace
(require 'whitespace)
(setq whitespace-line-column fill-column)
(setq whitespace-style '(face tabs trailing))
(global-whitespace-mode 1)

;; Split windows
(split-window-horizontally)

;; No menu bar
(menu-bar-mode -1)

;; Default mode
(setq default-major-mode 'text-mode)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

;; Keyboard
(set-keyboard-coding-system nil)

;; Highlight parens
(show-paren-mode t)

;; Kill startup message
(setq inhibit-startup-message t)

;; Replace Yes with Y (or N)
(fset 'yes-or-no-p 'y-or-n-p)

;; Bookmarks
(setq bookmark-save-flag 1)
(setq bookmark-default-file (concat emacs-dir "bookmarks"))

;; Line wrap
(set-default 'truncate-lines t)

;; Cua
(cua-mode 0)

;; Line numbers
(line-number-mode -1)
(global-linum-mode -1)
(setq linum-format "%4d ")

;; Winner mode
(winner-mode 1)

;; Startup
(setq inhibit-startup-message t)

;; Change auto-save directory
(setq backup-directory-alist `((".*" . ,temp-dir)))
(setq auto-save-file-name-transforms `((".*" ,temp-dir t)))

;; Hippie
(make-hippie-expand-function
 '(try-expand-dabbrev-visible
   try-expand-dabbrev
   try-expand-dabbrev-from-kill
   try-expand-dabbrev-all-buffers))

;; Minibuffers
(setq enable-recursive-minibuffers t
      max-mini-window-height .3   ;;  max 2 lines
      resize-mini-windows t)

(icomplete-mode t)                ;; completion in minibuffer

(setq complete-prospects-height 1 ;; don't spam my minibuffer
      icomplete-compute-delay 0)  ;; don't wait

;; IDO
(require 'ido)

(ido-mode 'both) ;; for buffers and files

(setq
  ido-save-directory-list-file "~/ido.last"
  ido-ignore-buffers ;; ignore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
     "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
  ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~/Code")
  ido-case-fold t                     ; be case-insensitive
  ido-enable-last-directory-history t ; remember last used dirs
  ido-max-work-directory-list 30      ; should be enough
  ido-max-work-file-list 50           ; remember many
  ido-use-filename-at-point nil       ; don't use filename at point (annoying)
  ido-use-url-at-point nil            ; don't use url at point (annoying)
  ido-enable-flex-matching nil        ; don't try to be too smart
  ido-max-prospects 10                ; don't spam my minibuffer
  ido-confirm-unique-completion t     ; wait for RET, even with unique completion
  ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

;; when using ido, the confirmation is rather annoying...
(setq confirm-nonexistent-file-or-buffer nil)

;; increase minibuffer size when ido completion is active
(add-hook 'ido-minibuffer-setup-hook
  (function
    (lambda ()
      (make-local-variable 'resize-minibuffer-window-max-height)
      (setq resize-minibuffer-window-max-height 1))))

;; don't truncate minibuffer lines
(add-hook 'ido-minibuffer-setup-hook
          (lambda ()
            (set (make-local-variable 'truncate-lines) nil)))

;; Set themes dir
(add-to-list 'custom-theme-load-path theme-dir)

;; Theme!
(load-theme 'zenburn)

;; Enable skeleton-pair insert globally
(setq skeleton-pair t)

;; Don't apply skeleton-pair from the front of a word
(setq skeleton-pair-on-word nil)

(global-set-key (kbd "<")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "(")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "[")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "{")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)

;; Haskell

(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(remove-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(remove-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; Distel for Erlang
(add-to-list 'load-path (concat package-dir "local/distel/elisp"))

(require 'distel)
(distel-setup)

; define where put beam files
(setq erlang-compile-outdir "../ebin")

(add-hook 'erlang-mode-hook
          (lambda ()
            (setq inferior-erlang-machine-options '("-sname" "emacs"))))

(setq auto-mode-alist
  (append auto-mode-alist
    '(("\\.rel$" . erlang-mode)
      ("\\.app$" . erlang-mode)
      ("\\.appSrc$" . erlang-mode)
      ("\\.app.src$" . erlang-mode)
      ("rebar.config" . erlang-mode)
      ("sys.config" . erlang-mode)
      ("app.config" . erlang-mode)
      ("Emakefile" . erlang-mode)
      ("\\.hrl$" . erlang-mode)
      ("\\.erl$" . erlang-mode)
      ("\\.yrl$" . erlang-mode))))

;; Auto Save
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Yaml
(require 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Highline
(highline-mode 1)

(set-face-background 'highline-face "#40404")

;; Workgroups
(winner-mode nil)

;; Modeline!

;; use setq-default to set it for /all/ modes
(setq-default mode-line-format
  (list
    ;; the buffer name; the file name as a tool tip
    '(:eval (propertize " %b" 'face 'zenburn-title
        'help-echo (buffer-file-name)))

    ;; the current major mode for the buffer.
    '(:eval (propertize " %m" 'face 'zenburn-lowlight-1
              'help-echo buffer-file-coding-system))

    ;; line and column
    (propertize " %02l" 'face 'zenburn-lowlight-1)
    ","
    (propertize "%c" 'face 'zenburn-lowlight-1)

    ;; was this buffer modified since the last save?
    '(:eval (when (buffer-modified-p)
              (concat " " (propertize "Modified"
                                      'face 'zenburn-red-2
                                      'help-echo "Buffer has been modified"))))

    ;; is this buffer read-only?
    '(:eval (when buffer-read-only
              (concat " " (propertize "ReadOnly"
                                      'face 'zenburn-blue
                                      'help-echo "Buffer is read-only"))))

    ;; minor-mode-alist  ;; list of minor modes
    ))

;; Follow symlinks into version controlled directories/files
(setq vc-follow-symlinks t)

;; Start up sie server
(server-force-delete)
(server-start)

