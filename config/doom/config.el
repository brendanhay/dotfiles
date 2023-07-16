;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;; (setq doom-font (font-spec :family "Essential PragmataPro" :size 14))
;; (setq doom-font (font-spec :family "Fira Code" :size 14))
(setq doom-font (font-spec :family "JetBrains Mono" :size 14))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/self/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq uniquify-buffer-name-style 'forward)

(setq which-key-idle-delay 0.25)

(after! ace-window
  (setq aw-keys '(?h ?j ?k ?l ?\; ?a ?s ?d ?f ?g)))

(map! :leader
      :desc "Ace select window"
      "d" #'ace-window)

(map! :leader
      (:prefix ("w" .  "window"))
      :desc "Ace select window"
      "ww" #'ace-window
      :desc "Ace swap window"
      "wa" #'ace-swap-window
      :desc "Ace delete window"
      "wd" #'ace-delete-window)

(use-package! orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

(after! rust-mode
  :init
  (setq lsp-rust-analyzer-cargo-run-build-scripts 't)
  (setq lsp-rust-analyzer-cargo-load-out-dirs-from-check 't)
  (setq lsp-rust-analyzer-proc-macro-enable 't)
  (setq lsp-rust-analyzer-experimental-proc-attr-macros 't)
  (setq lsp-rust-analyzer-cargo-watch-args ["--profile", "rust-analyzer"]))

(def-project-mode! +web-django-mode
  :modes '(web-mode)
  :on-enter
  (when (derived-mode-p 'web-mode)
    (setq web-mode-markup-indent-offset 4)
    (web-mode-set-engine "django")))
