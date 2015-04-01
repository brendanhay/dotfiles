;; Remove Visual Elements
(menu-bar-mode -1)

;; GUI Only
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Default mode
(setq default-major-mode 'text-mode)

;; Keyboard
(set-keyboard-coding-system nil)

;; Kill startup message
(setq inhibit-startup-message t)

;; Replace Yes with Y (or N)
(fset 'yes-or-no-p 'y-or-n-p)

;; Line wrap
(set-default 'truncate-lines t)

;; Cua
(cua-mode 0)

;; Startup
(setq inhibit-startup-message t)

;; Bookmarks
(setq bookmark-save-flag 1
      bookmark-default-file (concat emacs-dir "bookmarks"))

;; Kill whole line from any point
(setq kill-whole-line t)

;; Whitespace
(require 'whitespace)

(setq whitespace-line-column fill-column)
(setq whitespace-style '(face tabs trailing))

(global-whitespace-mode 1)

;; Soft tabs
(setq-default indent-tabs-mode nil)

;; Treat Cased Parts of word as different
(subword-mode 1)

;; Window Movement
(setq windmove-wrap-around t)

;; Expansion
(setq hippie-expand-verbose nil
      hippie-expand-dabbrev-as-symbol t
      hippie-expand-try-functions-list (quote
                                        (my-ido-hippie-expand
                                         try-expand-dabbrev-visible
                                         try-expand-dabbrev-from-kill
                                         try-expand-dabbrev-all-buffers
                                         try-complete-file-name-partially
                                         try-complete-file-name)))

;; Minibuffers
(setq enable-recursive-minibuffers nil
      max-mini-window-height 20   ;;  max 2 lines
      resize-mini-windows 1)

;; Completion in minibuffer
(icomplete-mode 1)

(setq complete-prospects-height 1 ;; don't spam my minibuffer
      icomplete-compute-delay 0)  ;; don't wait

;; IDO
(require 'ido)

;; (ido-mode 'both) ;; for buffers and files

;; (setq ido-save-directory-list-file "~/ido.last"
;;       ido-ignore-buffers '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
;;                            "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
;;       ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~/proj" "~/code")
;;       ido-case-fold t                     ; be case-insensitive
;;       ido-enable-last-directory-history t ; remember last used dirs
;;       ido-max-work-directory-list 15      ; should be enough
;;       ido-max-work-file-list 25           ; remember many
;;       ido-use-filename-at-point nil       ; don't use filename at point (annoying)
;;       ido-use-url-at-point nil            ; don't use url at point (annoying)
;;       ido-enable-flex-matching nil        ; don't try to be too smart
;;       ido-max-prospects 10                ; don't spam my minibuffer
;;       ido-confirm-unique-completion t     ; wait for RET, even with unique completion
;;       ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

;; when using ido, the confirmation is rather annoying...
(setq confirm-nonexistent-file-or-buffer nil)

;; increase minibuffer size when ido completion is active
;; (add-hook 'ido-minibuffer-setup-hook
;;   (function
;;    (lambda ()
;;      (make-local-variable 'resize-minibuffer-window-max-height)
;;      (setq resize-minibuffer-window-max-height 1))))

;; don't truncate minibuffer lines
;; (add-hook 'ido-minibuffer-setup-hook
;;           (lambda ()
;;             (set (make-local-variable 'truncate-lines) nil)))

(add-hook 'minibuffer-setup-hook
      (lambda () (setq truncate-lines nil)))

;; Buffers
(require 'uniquify)

;; (setq uniquify-buffer-name-style 'post-forward)
;; (setq uniquify-after-kill-buffer-p t)
;; (setq uniquify-ignore-buffers-re "^\\*")

;; Parens
;; Enable skeleton-pair insert globally
(setq skeleton-pair t)

;; Don't apply skeleton-pair from the front of a word
(setq skeleton-pair-on-word nil)

;; Highlight parens
(show-paren-mode 1)

;; Symlinks
(setq vc-follow-symlinks t)

;; Auto Save
(setq backup-directory-alist         `((".*" . ,tmp-dir))
      auto-save-file-name-transforms `((".*" ,tmp-dir t)))

;; TAGS
(setq tags-revert-without-query 1)

;; Columns
(setq column-number-mode 1)

;; Fill columns
(require 'fill-column-indicator)

(setq fci-rule-color "#1f1f1f")

(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda ()
    (setq fill-column 79)
    (fci-mode 1)))

(global-fci-mode 1)

;; Window margins
(add-hook 'window-configuration-change-hook
          (lambda ()
            (set-window-margins (car (get-buffer-window-list (current-buffer) nil t)) 0 0)))

;; Server
(load "server")

(unless (server-running-p) (server-start))

;; Helm
(require 'helm)
(require 'helm-config)

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)

;; Projectile
(projectile-global-mode)

;; Default mode
(setq default-major-mode 'text-mode)

;; Keyboard
(set-keyboard-coding-system nil)

;; Kill startup message
(setq inhibit-startup-message t)

;; Replace Yes with Y (or N)
(fset 'yes-or-no-p 'y-or-n-p)

;; Line wrap
(set-default 'truncate-lines t)

;; Cua
(cua-mode 0)

;; Startup
(setq inhibit-startup-message t)

;; Bookmarks
(setq bookmark-save-flag 1
      bookmark-default-file (concat emacs-dir "bookmarks"))

;; Kill whole line from any point
(setq kill-whole-line t)

;; Whitespace
(require 'whitespace)

(setq whitespace-line-column fill-column)
(setq whitespace-style '(face tabs trailing))

(global-whitespace-mode 1)

;; Soft tabs
(setq-default indent-tabs-mode nil)

;; Treat Cased Parts of word as different
(subword-mode 1)

;; Window Movement
(setq windmove-wrap-around t)

;; Expansion
(setq hippie-expand-verbose nil
      hippie-expand-dabbrev-as-symbol t
      hippie-expand-try-functions-list (quote
                                        (my-ido-hippie-expand
                                         try-expand-dabbrev-visible
                                         try-expand-dabbrev-from-kill
                                         try-expand-dabbrev-all-buffers
                                         try-complete-file-name-partially
                                         try-complete-file-name)))

;; Minibuffers
(setq enable-recursive-minibuffers nil
      max-mini-window-height 20   ;;  max 2 lines
      resize-mini-windows 1)

;; Completion in minibuffer
(icomplete-mode 1)

(setq complete-prospects-height 1 ;; don't spam my minibuffer
      icomplete-compute-delay 0)  ;; don't wait

;; IDO
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

(add-hook 'minibuffer-setup-hook
      (lambda () (setq truncate-lines nil)))

;; Buffers
(require 'uniquify)

(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; Parens
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

;; Highlight parens
(show-paren-mode 1)

;; Symlinks
(setq vc-follow-symlinks t)

;; Auto Save
(setq backup-directory-alist         `((".*" . ,tmp-dir))
      auto-save-file-name-transforms `((".*" ,tmp-dir t)))

;; TAGS
(setq tags-revert-without-query 1)

;; Columns
(setq column-number-mode 1)

;; Fill columns
(require 'fill-column-indicator)

(setq fci-rule-color "#1f1f1f")

(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda ()
    (setq fill-column 79)
    (fci-mode 1)))

(global-fci-mode 1)

;; Window margins
(add-hook 'window-configuration-change-hook
          (lambda ()
            (set-window-margins (car (get-buffer-window-list (current-buffer) nil t)) 0 0)))

;; Server
(load "server")

(unless (server-running-p) (server-start))

;; Helm
(require 'helm)
(require 'helm-config)

(setq helm-split-window-in-side-p           t   ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     nil ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t   ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8   ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)

;; Projectile
(projectile-global-mode)

;; Line Numbers
(setq linum-format "%4d ")

(add-hook 'prog-mode-hook 'linum-mode)
