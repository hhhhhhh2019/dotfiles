;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Alexey Galov"
      user-mail-address "agalove543210@gmail.com")


(setq doom-font (font-spec :family "SF Mono" :size 14)
      doom-big-font (font-spec :family "SF Mono" :size 20))

(setq catppuccin-flavor 'mocha)
(setq doom-theme 'catppuccin)

(use-package! auto-dark
  :init
  (setq auto-dark-themes '((catppuccin) (catppuccin)))
  (setq! doom-theme nil)
  (setq! custom-safe-themes t)
  (add-hook 'auto-dark-dark-mode-hook
    (lambda ()
      (setq catppuccin-flavor 'mocha)
      (catppuccin-reload)))
  (add-hook 'auto-dark-light-mode-hook
    (lambda ()
      (setq catppuccin-flavor 'latte)
      (catppuccin-reload)))
  (auto-dark-mode t))

(setq display-line-numbers-type nil)

(setq org-directory "~/org/")

(use-package! reverse-im
  :init
  (setq reverse-im-char-fold t)
  (setq reverse-im-read-char-advice-function #'reverse-im-read-char-include)
  (setq reverse-im-input-methods '("ukrainian-computer"))
  :config
  (reverse-im-mode t))

(with-eval-after-load 'corfu-auto
  (setq corfu-auto nil))

;; (setq-default tab-always-indent 'complete)
;; (setq-default c-tab-always-indent 'complete)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq-default c-ts-mode-indent-offset 4)

(with-eval-after-load 'projectile
  (setq projectile-git-fd-args "-H -0 -E .git -tf"))


(custom-set-faces!
  `(font-lock-property-name-face :foreground ,(doom-color 'fg))
  `(font-lock-property-use-face :foreground ,(doom-color 'fg))
  `(font-lock-function-name-face :foreground ,(doom-color 'fg)))

(setq
 gptel-model 'llama3.2:latest
 gptel-backend (gptel-make-ollama "Ollama"
                 :host "localhost:11434"
                 :stream t
                 :models '(llama3.2:latest)))


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
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
