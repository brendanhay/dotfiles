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
  (lambda () (setq fill-column 76) (fci-mode 1)))

(global-fci-mode 1)

;; Markdown
(setq markdown-command-needs-filename 1)

(setq auto-mode-alist
  (append auto-mode-alist
    '(("\\.md$" . markdown-mode)
      ("\\.markdown$" . markdown-mode)
      ("\\.mdown$" . markdown-mode))))

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
; (remove-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'markdown-mode-hook 'turn-on-auto-fill)

;; Keyboard
(set-keyboard-coding-system nil)

;; Kill startup message
(setq inhibit-startup-message t)

;; Replace Yes with Y (or N)
(fset 'yes-or-no-p 'y-or-n-p)

;; Bookmarks
(setq bookmark-save-flag 1
      bookmark-default-file (concat emacs-dir "bookmarks"))

;; Line wrap
(set-default 'truncate-lines t)

;; Cua
(cua-mode 0)

;; Line numbers
(setq line-number-mode nil
      global-linum-mode nil
      linum-format "%4d ")

;; Winner mode
(winner-mode 1)

;; Startup
(setq inhibit-startup-message t)

;; Change auto-save directory
(setq backup-directory-alist `((".*" . ,temp-dir))
      auto-save-file-name-transforms `((".*" ,temp-dir t)))

;; Hippie
(setq hippie-expand-verbose nil
      hippie-expand-dabbrev-as-symbol t
      hippie-expand-try-functions-list
      (quote
       (try-expand-dabbrev-visible
        try-expand-dabbrev-from-kill
        try-expand-dabbrev-all-buffers
        try-complete-file-name-partially
        try-complete-file-name)))

;; Minibuffers
(setq enable-recursive-minibuffers nil
      max-mini-window-height .3   ;;  max 2 lines
      resize-mini-windows -1)

(icomplete-mode 1)                ;; completion in minibuffer

(setq complete-prospects-height 1 ;; don't spam my minibuffer
      icomplete-compute-delay 0)  ;; don't wait

;; ;; IDO
(require 'ido)

(ido-mode 'both) ;; for buffers and files

(setq ido-save-directory-list-file "~/ido.last"
      ido-ignore-buffers '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
                           "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
      ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~/Code")
      ido-case-fold t                     ; be case-insensitive
      ido-enable-last-directory-history t ; remember last used dirs
      ido-max-work-directory-list 15      ; should be enough
      ido-max-work-file-list 25           ; remember many
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

;; Erlang
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

;; Auto Save
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Yaml
(require 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Highlight parens
(show-paren-mode -1)
;; ;; show-paren-match-face and show-paren-mismatch-face

;; Highline
(highline-mode -1)
;; (set-face-background 'highline-face "#444")

;; Workgroups
(winner-mode -1)

;; Modeline!
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

;; Ruby
(setq auto-mode-alist
  (append auto-mode-alist
    '(("Rakefile$" . ruby-mode)
      ("Gemfile\\." . ruby-mode)
      ("Gemfile$" . ruby-mode))))


;; Auto Save
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; TAGS
(setq tags-revert-without-query 1)
