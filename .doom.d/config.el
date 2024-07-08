;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package xresources-theme)
(use-package math-symbol-lists)
(use-package markdown-preview-mode)
(use-package boogie-friends)
(use-package zig-mode)

(after! evil-escape
  (setq evil-escape-key-sequence "kj"))

(defun comments-only ()
  "Turn syntax-highlighting off, except for comments."
  (interactive)
  (let ((faces '(font-lock-builtin-face
                 font-lock-constant-face
                 ; font-lock-doc-face
                 font-lock-function-name-face
                 font-lock-keyword-face
                 font-lock-negation-char-face
                 font-lock-preprocessor-face
                 font-lock-regexp-grouping-backslash
                 font-lock-regexp-grouping-construct
                 ; font-lock-string-face
                 font-lock-type-face
                 font-lock-variable-name-face
                 font-lock-warning-face)))
    (dolist (face faces)
      (face-remap-add-relative face '((:foreground "" :weight normal :slant normal))))
    ; (face-remap-add-relative 'font-lock-builtin-face '((:weight bold)))
    ; (face-remap-add-relative 'font-lock-constant-face '((:weight bold)))
    (face-remap-add-relative 'font-lock-function-name-face '((:slant italic)))
    ; (face-remap-add-relative 'font-lock-keyword-face '((:weight bold)))
    (face-remap-add-relative 'font-lock-preprocessor-face '((:weight bold)))
    ; (face-remap-add-relative 'font-lock-doc-face '((:slant italic)))
    ; (face-remap-add-relative 'font-lock-string-face '((:slant italic)))
    ))

(setq doom-theme 'doom-solarized-light)

(add-hook 'coq-mode-hook (lambda () (set-input-method "math")))

(comments-only)

(defun my-inherit-input-method ()
  "Inherit input method from `minibuffer-selected-window'."
  (let* ((win (minibuffer-selected-window))
         (buf (and win (window-buffer win))))
    (when buf
      (activate-input-method (buffer-local-value 'current-input-method buf)))))
(add-hook 'minibuffer-setup-hook #'my-inherit-input-method)
; Define the actual input method
(quail-define-package "math" "UTF-8" "Ω" t)
(quail-define-rules ; add whatever extra rules you want to define here...
 ("\\fun"    ?λ)
 ("\\mult"   ?⋅)
 ("\\ent"    ?⊢)
 ("\\valid"  ?✓)
 ("\\diamond" ?◇)
 ("\\box"    ?□)
 ("\\bbox"   ?■)
 ("\\later"  ?▷)
 ("\\pred"   ?φ)
 ("\\and"    ?∧)
 ("\\or"     ?∨)
 ("\\comp"   ?∘)
 ("\\ccomp"  ?◎)
 ("\\all"    ?∀)
 ("\\ex"     ?∃)
 ("\\to"     ?→)
 ("\\sep"    ?∗)
 ("\\lc"     ?⌜)
 ("\\rc"     ?⌝)
 ("\\Lc"     ?⎡)
 ("\\Rc"     ?⎤)
 ("\\lam"    ?λ)
 ("\\empty"  ?∅)
 ("\\Lam"    ?Λ)
 ("\\Sig"    ?Σ)
 ("\\-"      ?∖)
 ("\\aa"     ?●)
 ("\\af"     ?◯)
 ("\\auth"   ?●)
 ("\\frag"   ?◯)
 ("\\iff"    ?↔)
 ("\\gname"  ?γ)
 ("\\incl"   ?≼)
 ("\\latert" ?▶)
 ("\\update" ?⇝)

 ;; for verus+iris
 ("\\lb" ?⟦)
 ("\\rb" ?⟧)
 ("\\la" ?⟨)
 ("\\ra" ?⟩)

 ;; accents (for iLöb)
 ("\\\"o" ?ö)

 ;; subscripts and superscripts
 ("^^+" ?⁺) ("__+" ?₊) ("^^-" ?⁻)
 ("__0" ?₀) ("__1" ?₁) ("__2" ?₂) ("__3" ?₃) ("__4" ?₄)
 ("__5" ?₅) ("__6" ?₆) ("__7" ?₇) ("__8" ?₈) ("__9" ?₉)

 ("__a" ?ₐ) ("__e" ?ₑ) ("__h" ?ₕ) ("__i" ?ᵢ) ("__k" ?ₖ)
 ("__l" ?ₗ) ("__m" ?ₘ) ("__n" ?ₙ) ("__o" ?ₒ) ("__p" ?ₚ)
 ("__r" ?ᵣ) ("__s" ?ₛ) ("__t" ?ₜ) ("__u" ?ᵤ) ("__v" ?ᵥ) ("__x" ?ₓ)
)
(mapc (lambda (x)
        (if (cddr x)
            (quail-defrule (cadr x) (car (cddr x)))))
      (append math-symbol-list-extended math-symbol-list-basic))

;; Iris indentation
(setq coq-smie-user-tokens
      '(("," . ":=")
        ("∗" . "->")
        ("-∗" . "->")
        ("∗-∗" . "->")
        ("==∗" . "->")
        ("=∗" . "->") ;; Hack to match ={E1,E2}=∗
        ("|==>" . ":=")
        ("⊢" . "->")
        ("⊣⊢" . "->")
        ("↔" . "->")
        ("←" . "<-")
        ("→" . "->")
        ("=" . "->")
        ("==" . "->")
        ("/\\" . "->")
        ("⋅" . "->")
        (":>" . ":=")
        ("by" . "now")
        ("forall" . "now") ;; NB: this breaks current ∀ indentation.
        ))



;; Fonts
(set-face-attribute 'default nil :height 110) ; height is in 1/10pt
(dolist (ft (fontset-list))
  ; Main font
  (set-fontset-font ft 'unicode (font-spec :name "Monospace"))
  ; Fallback font
  ; Appending to the 'unicode list makes emacs unbearably slow.
  ;(set-fontset-font ft 'unicode (font-spec :name "DejaVu Sans Mono") nil 'append)
  (set-fontset-font ft nil (font-spec :name "DejaVu Sans Mono"))
)
; Fallback-fallback font
; If we 'append this to all fontsets, it picks Symbola even for some cases where DejaVu could
; be used. Adding it only to the "t" table makes it Do The Right Thing (TM).
(set-fontset-font t nil (font-spec :name "Symbola"))

(defun move-ten-lines-down ()
  (interactive)
  (next-line 10)
)

(defun move-ten-lines-up ()
  (interactive)
  (previous-line 10)
  )

(define-key evil-normal-state-map (kbd "C-j") 'move-ten-lines-down)
(define-key evil-normal-state-map (kbd "C-k") 'move-ten-lines-up)


(setq doom-font (font-spec :family "monospace")
      doom-variable-pitch-font (font-spec :family "sans"))

(setq doom-unicode-font (font-spec :family "Symbola" :size 26))

(setq markdown-preview-stylesheets (list "https://unpkg.com/purecss@2.0.3/build/pure-min.css"))

; mathjax for markdown preview
(add-to-list 'markdown-preview-javascript "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js")

(setq coq-compiler (concat "/home/upamanyu/.opam/4.14.1/bin/coqc"))
(setq coq-prog-name (concat "/home/upamanyu/.opam/4.14.1/bin/coqtop"))
(setq coq-dependency-analyzer (concat "/home/upamanyu/.opam/4.14.1/bin/coqdep"))

; (setq coq-compiler (concat "/home/upamanyu/.opam/clutch/bin/coqc"))
; (setq coq-prog-name (concat "/home/upamanyu/.opam/clutch/bin/coqtop"))
; (setq coq-dependency-analyzer (concat "/home/upamanyu/.opam/clutch/bin/coqdep"))


; (setq p-override-pascal-file-type t)

;; https://github.com/doomemacs/doomemacs/issues/5823
;; Fix for slow startup
(after! core-editor
  (add-to-list 'doom-detect-indentation-excluded-modes 'coq-mode))


(defun hi ()
  (add-text-properties (region-beginning) (region-end) '(font-lock-face (:background "#FF0"))))

(defun nohi ()
  (set-text-properties (region-beginning) (region-end) '(font-lock-face ())))

(defun select-color () (set-face-attribute 'region nil :background "#FDF" :foreground "#080"))
