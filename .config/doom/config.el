;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 20)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 20)
      doom-symbol-font (font-spec :family "Symbols Nerd Font Mono" :size 20)
      doom-big-font (font-spec :family "FiraCode Nerd Font Mono" :size 30))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq catppuccin-flavor 'latte)
(setq catppuccin-flavor 'mocha)
(setq doom-theme 'catppuccin)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


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

(use-package ligature
  :config
  (ligature-set-ligatures 't '(
        ("<" (rx (+ (or "=" "-" ">"))))
        (">" (rx (+ (or "=" "-" "<"))))
        ("=" (rx (+ (or "=" ">" "<" "|" "!" "/"))))
        ("-" (rx (+ (or "-" ">" "<" "|" "~"))))
        ("_" (rx (+ "_")))
        ("#" (rx (+ (or "#" "[" "(" ":" "="))))
        ("+" (rx (or ">" (+ "+"))))
        (":" (rx (or ">" "<" "=" "//" ":=" (+ ":"))))
        ("?" (rx (or ":" "=" "\." (+ "?"))))
        ("0" (rx (and "x" (+ (in "A-F" "a-f" "0-9")))))
        ;; "Fl" "Tl" "fi" "fj" "fl" "ft"
        "{|" "[|" "]#" "(*" "}#" "^=" "!="
  ))
  (global-ligature-mode t))


(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))


(defun my-maybe-right ()
  "Move right if char at point is not a newline."
  (interactive)
  (unless (= (following-char) ?\n) (forward-char)))

(global-set-key [right] #'my-maybe-right)


(after! dap-mode
  (setq dap-python-debugger 'debugpy))

(use-package! dap-mode
  :config
  (require 'dap-node)
  (dap-node-setup))


(global-unset-key (kbd "C-a"))
(global-set-key (kbd "C-a") 'evil-numbers/inc-at-pt)
(global-unset-key (kbd "C-s"))
(global-set-key (kbd "C-s") 'evil-numbers/dec-at-pt)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on 'tree-sitter-hl-mode)

(setq-default indent-tabs-mode t)
(setq c-basic-offset 4)

(after! dap-mode
  (setq dap-cpptools-extension-version "1.5.1")

  (require 'dap-gdb-lldb)

  (with-eval-after-load 'lsp-rust
    (require 'dap-cpptools))

  (dap-register-debug-template "Rust::GDB Run Configuration"
                             (list :type "gdb"
                                   :request "launch"
                                   :name "GDB::Run"
                                   :gdbpath "rust-gdb"
                                   :target nil
                                   :cwd nil))

  ;; (with-eval-after-load 'dap-cpptools
  ;;   ;; Add a template specific for debugging Rust programs.
  ;;   ;; It is used for new projects, where I can M-x dap-edit-debug-template
  ;;   (dap-register-debug-template "Rust::CppTools Run Configuration"
  ;;                                (list :type "cppdbg"
  ;;                                      :request "launch"
  ;;                                      :name "Rust::Run"
  ;;                                      :MIMode "gdb"
  ;;                                      :miDebuggerPath "rust-gdb"
  ;;                                      :environment []
  ;;                                      :program "${workspaceFolder}/target/debug/hello / replace with binary"
  ;;                                      :cwd "${workspaceFolder}"
  ;;                                      :console "external"
  ;;                                      :dap-compilation "cargo build"
  ;;                                      :dap-compilation-dir "${workspaceFolder}")))

  (with-eval-after-load 'dap-mode
    (setq dap-default-terminal-kind "integrated")
    (dap-auto-configure-mode +1)))

(after! dap-mode
  (require 'dap-lldb)
  (setq dap-auto-configure-features '(sessions locals controls tooltip))
  (dap-register-debug-template "Rust::GDB Run Configuration"
			       (list :type "gdb"
				     :request "launch"
				     :name "GDB::Run"
				     :gdbpath "rust-gdb"
                                     :target nil
                                     :cwd nil))
)

(map! :map dap-mode-map
      :leader
      :prefix ("d" . "dap")
      ;; basics
      :desc "dap next"          "n" #'dap-next
      :desc "dap step in"       "i" #'dap-step-in
      :desc "dap step out"      "o" #'dap-step-out
      :desc "dap continue"      "c" #'dap-continue
      :desc "dap hydra"         "h" #'dap-hydra
      :desc "dap debug restart" "r" #'dap-debug-restart
      :desc "dap debug"         "s" #'dap-debug

      ;; debug
      :prefix ("dd" . "Debug")
      :desc "dap debug recent"  "r" #'dap-debug-recent
      :desc "dap debug last"    "l" #'dap-debug-last

      ;; eval
      :prefix ("de" . "Eval")
      :desc "eval"                "e" #'dap-eval
      :desc "eval region"         "r" #'dap-eval-region
      :desc "eval thing at point" "s" #'dap-eval-thing-at-point
      :desc "add expression"      "a" #'dap-ui-expressions-add
      :desc "remove expression"   "d" #'dap-ui-expressions-remove

      :prefix ("db" . "Breakpoint")
      :desc "dap breakpoint toggle"      "b" #'dap-breakpoint-toggle
      :desc "dap breakpoint condition"   "c" #'dap-breakpoint-condition
      :desc "dap breakpoint hit count"   "h" #'dap-breakpoint-hit-condition
      :desc "dap breakpoint log message" "l" #'dap-breakpoint-log-message)



(use-package char-fold
  :custom
  (char-fold-symmetric t)
  (search-default-mode #'char-fold-to-regexp))

(use-package reverse-im
  :demand t ; always load it
  :after char-fold ; but only after `char-fold' is loaded
  :bind
  ("M-T" . reverse-im-translate-word) ; fix a word in wrong layout
  :custom
  ;; cache generated keymaps
  (reverse-im-cache-file (locate-user-emacs-file "reverse-im-cache.el"))
  ;; use lax matching
  (reverse-im-char-fold t)
  (reverse-im-read-char-advice-function #'reverse-im-read-char-include)
  ;; translate these methods
  (reverse-im-input-methods '("russian-computer"))
  :config
  (reverse-im-mode t))


(setq display-line-numbers-type 'relative)


(defun my/text-scale-adjust-latex-previews ()
  (pcase major-mode
    ('latex-mode
     (dolist (ov (overlays-in (point-min) (point-max)))
       (if (eq (overlay-get ov 'category)
               'preview-overlay)
           (my/text-scale--resize-fragment ov))))
    ('org-mode
     (dolist (ov (overlays-in (point-min) (point-max)))
       (if (eq (overlay-get ov 'org-overlay-type)
               'org-latex-overlay)
           (my/text-scale--resize-fragment ov))))))

(defun my/text-scale--resize-fragment (ov)
  (overlay-put
   ov 'display
   (cons 'image
         (plist-put
          (cdr (overlay-get ov 'display))
          :scale (+ 1.0 (* 0.25 text-scale-mode-amount))))))

(add-hook 'text-scale-mode-hook #'my/text-scale-adjust-latex-previews)

(setq org-preview-latex-default-process 'dvisvgm)
(require 'org)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
