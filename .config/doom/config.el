(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 20)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font Mono" :size 20)
      doom-symbol-font (font-spec :family "Symbols Nerd Font Mono" :size 20)
      doom-big-font (font-spec :family "FiraCode Nerd Font Mono" :size 30))

(setq catppuccin-flavor 'latte)
(setq doom-theme 'catppuccin)

(setq display-line-numbers-type t)

(setq org-directory "~/org/")

(use-package! ligature
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
                               ("|" (rx (+ "-")))
                               ;; "Fl" "Tl" "fi" "fj" "fl" "ft"
                               "{|" "[|" "]#" "(*" "}#" "^=" "!="
                               ">>=" "<<="
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


(global-unset-key (kbd "C-a"))
(global-set-key (kbd "C-a") 'evil-numbers/inc-at-pt)
(global-unset-key (kbd "C-s"))
(global-set-key (kbd "C-s") 'evil-numbers/dec-at-pt)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on 'tree-sitter-hl-mode)

(setq-default indent-tabs-mode t)
(setq c-basic-offset 4)


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
(setq org-startup-with-inline-images 't)


(defadvice align-regexp (around align-regexp-with-spaces activate)
  (let ((indent-tabs-mode nil))
    ad-do-it))


(after! gptel
  (gptel-make-ollama "Ollama"
    :host "localhost:11434"
    :stream t
    :models '(gemma3:latest))
  )
