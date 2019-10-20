;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Kerem Vatandas - Emacs Dotfiles                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  C-a Move to beginning of line
;;  C-e Move to end of line
;;  M-f M-b Move forward/backword one word
;;  M-< M-> Move to beginning of buffer and end of buffer
;;  C-space  --  Select region

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Garbage Collect
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Always load newest byte code
;; prefer newer non-byte compiled sources to older byte compiled ones
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
(defvar gc-cons-threshold--orig gc-cons-threshold)
(setq gc-cons-threshold (* 100 1024 1024)
      gc-cons-percentage 0.6)


;; Use package management!
(require 'package)

;; why the fuck aren't these https!
(setq package-archives
      '(("org"          . "http://orgmode.org/elpa/")
	;; let's stick with more stable packages for a bit
	("melpa"        . "http://melpa.org/packages/")
	("melpa-stable" . "http://stable.melpa.org/packages/")
	;; ssl not validating!
	;; ("marmalade"    . "http://marmalade-repo.org/packages/")
	("gnu"          . "http://elpa.gnu.org/packages/")))

(setq package-archive-priorities
      '(("gnu"          . 100)
	("org"          . 90)
	("melpa-stable" . 80)
	("melpa"        . 70)
	("marmalade"    . 60)))

(package-initialize)


(setq use-package-always-ensure nil)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

;; This must be first, and it makes everything else a little bit easier.
;;; -*- lexical-binding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SECURITY
;; https://glyph.twistedmatrix.com/2015/11/editor-malware.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq
;;  cm/machine-trust-file
;;  (cond
;;   ((string-prefix-p "nevada" system-name) (concat (getenv "HOME") "/.guix-profile/etc/ssl/ca-certificates.crt"))
;;   ((string-prefix-p "nordic" system-name) "/etc/ssl/certs/ca-certificates.crt")
;;   ((string-prefix-p "novaria" system-name) "/etc/ssl/certs/ca-certificates.crt")
;;   ((string-prefix-p "neah" system-name) "/etc/ssl/certs/ca-certificates.crt")
;;   ((string-prefix-p "jmickey-glaptop" system-name) "/etc/ssl/certs/ca-certificates.crt")
;;   ((string-prefix-p "manatee" system-name) "/etc/ssl/certs/ca-certificates.crt")
;;   (t (error "No tls trust set for this host! Add exception or find cert.pem you trust"))))

;; (setq tls-program
;;       (concat "gnutls-cli --x509cafile " cm/machine-trust-file " -p %p %h"))

;; (setq gnutls-verify-error t)
;; (setq gnutls-trustfiles (list cm/machine-trust-file))

;; ElDOC Disable for LSP
;; (global-eldoc-mode -1)
;; (eldoc-mode -1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Personal Information
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-full-name "Kerem Vatandas"
      user-mail-address "keremvatandas@gmail.com")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Default Encoding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; User Interface
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-buffer-menu t)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq create-lockfiles nil)

;; Emacs Title Bar
(setq frame-title-format '("%m " invocation-name "@" system-name))

;; Yes or no, let’s do y/p
(fset 'yes-or-no-p 'y-or-n-p)

;; This makes sure that we pick a new buffer and just run with it,
;; instead of checking if another process is running.
(setq async-shell-command-buffer 'rename-buffer)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Font and Size
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-frame-font "Hasklig 12")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MacOS Path Export
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
    (setenv "PATH" path)
    (setq exec-path
	(append
	(split-string-and-unquote path ":")
	exec-path)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Async Shell Command to String
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun async-shell-command-to-string (command callback)
  "Execute shell command COMMAND asynchronously in the
  background.

  Return the temporary output buffer which command is writing to
  during execution.

  When the command is finished, call CALLBACK with the resulting
  output as a string."
  (lexical-let ((output-buffer (generate-new-buffer " *temp*"))
		(callback-fun callback))
	       (set-process-sentinel
		(start-process "Shell" output-buffer shell-file-name shell-command-switch command)
		(lambda (process signal)
		  (when (memq (process-status process) '(exit signal))
		    (with-current-buffer output-buffer
		      (let ((output-string
			     (buffer-substring-no-properties (point-min) (point-max))))
			(funcall callback-fun output-string)))
		    (kill-buffer output-buffer))))
	       output-buffer))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This adds line numbers and column numbers in the emacs modeline.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(line-number-mode 1)
(column-number-mode 1)

;; Recursive Mini Buffer
(setq enable-recursive-minibuffers t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Big File
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)



;; Common lisp has things like cl-loop, which are life.
(require 'cl)

;; Narrow Region Disable
(put 'narrow-to-region 'disabled nil)

;; Performance improvement of vertical window scroll
(setq auto-window-vscroll nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Backups
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq vc-make-backup-files t
    version-control t
    kept-new-versions 10
    kept-old-versions 0
    delete-old-versions t
    backup-by-copying t
    backup-directory-alist '(("" . "~/.emacs-backup")))

(defun cm/force-backup-of-buffer ()
(let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook 'cm/force-backup-of-buffer)



;; ***********************************************************************
;; ***********************************************************************
;; **************************** PACKAGES *********************************
;; ***********************************************************************
;; ***********************************************************************

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org :ensure t)
(setq org-src-fontify-natively t
      org-src-window-setup 'current-window
      org-src-strip-leading-and-trailing-blank-lines t
      org-src-preserve-indentation t
      org-src-tab-acts-natively t)

;;  Bullet from *
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Ellipsis from ...
(setq org-ellipsis "⤵")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Diminish/Dash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package dash :ensure t)
(use-package diminish :ensure t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Treat all themes as safe. Avoiding prompt for yes and no.
(setq custom-safe-themes t)

(use-package challenger-deep-theme
  :ensure t
  :init
  (load-theme 'challenger-deep t))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Wind Move
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package windmove
  :bind
  (("C-c <right>" . windmove-right)
   ("C-c <left>" . windmove-left)
   ("C-c <up>" . windmove-up)
   ("C-c <down>" . windmove-down)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Neo Tree
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package neotree
  :ensure t
  :init (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  :config (global-set-key (kbd "C-c n") 'neotree-toggle))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Line Reminder - ||
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package line-reminder
  :ensure t
  :init (global-line-reminder-mode t)
  :config
  (setq line-reminder-modified-sign "▐")
  (setq line-reminder-saved-sign "▐")
  (setq line-reminder-linum-left-string "")
  (setq line-reminder-linum-right-string " ")
  (setq line-reminder-ignore-buffer-names
	'("*Backtrace*"
	  "*Buffer List*"
	  "*Checkdoc Status*"
	  "*Echo Area"
	  "*helm"
	  "*Help*"
	  "magit"
	  "*Minibuf-"
	  "*Packages*"
	  "*run*"
	  "*shell*")))


(use-package company
    :config
    (setq company-idle-delay 0.3)

    (global-company-mode 1)

    (global-set-key (kbd "C-<space>") 'company-complete))

(use-package company-lsp
  :ensure t
  :init (push 'company-lsp company-backends)
  :config
  (setq company-lsp-enable-recompletion t
	company-lsp-enable-snippet t
	company-lsp-cache-candidates t
	company-lsp-async t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package magit
  :ensure t
  :init
  (progn
    (bind-key "C-x g" 'magit-status)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Anzu Replace
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package anzu
  :ensure t
  :bind (("M-%" . anzu-query-replace)
	 ("C-M-%" . anzu-query-replace-regexp)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smooth Scrolling
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package smooth-scrolling
  :ensure t
  :config
  (progn
    (setq-default smooth-scroll-margin 2)
    (smooth-scrolling-mode)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Diff HL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package diff-hl
  :ensure t
  :config
  (progn
    (global-diff-hl-mode)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Nyan Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package nyan-mode
  :ensure t
  :custom
  (nyan-cat-face-number 4)
  (nyan-animate-nyancat t)
  :hook
   (doom-modeline-mode . nyan-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  All The Icons
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package all-the-icons
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Counsel / Ivy / Swiper
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package counsel
  :after ivy
  :config (counsel-mode)
  (setq ivy-display-style 'fancy)
  :bind* ; load when pressed
  (("M-x"     . counsel-M-x)
   ("C-s"     . swiper)
   ("C-x C-f" . counsel-find-file)
   ("C-x b" . ivy-switch-buffer)  ; search for recently edited
   ("C-c g"   . counsel-git)      ; search for files in git repo
   ("C-c j"   . counsel-git-grep) ; search for regexp in git repo
   ("C-x l"   . counsel-locate)
   ("C-h f"  . counsel-describe-function)
   ("C-h v"  . counsel-describe-variable)
   ("C-h l"  . counsel-find-library)
   ("C-h i"  . counsel-info-lookup-symbol)
   ("C-c C-r" . ivy-resume)))

(use-package all-the-icons-ivy
  :ensure t
  :config
  (all-the-icons-ivy-setup))

(use-package ivy
  :diminish (ivy-mode . "")
  :init (ivy-mode 1) ; globally at startup
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 20)
  (setq ivy-count-format "%d/%d "))

(use-package ivy-rich
  :ensure t
  :after (:all ivy counsel)
  :init (setq ivy-rich-parse-remote-file-path t)
  :config (ivy-rich-mode 1))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Save Place
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; WhichKey Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package which-key
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-right-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
	which-key-side-window-max-width 0.33
	which-key-idle-delay 1)
  :diminish which-key-mode)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Undo Tree
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package undo-tree
  :bind
  ("C-c u" . undo-tree-redo)
  :config
  (global-undo-tree-mode))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; HL Line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package hl-line
  :ensure nil
  :hook
  (after-init . global-hl-line-mode))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rainbow Delimiters/Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color parenthesis
(use-package rainbow-delimiters
  :ensure t
  :defer t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode))

;; Color each identifier
(use-package rainbow-identifiers
  :ensure t
  :defer t
  :init
  (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paredit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package paredit
  :ensure t
  :init
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
  (add-hook 'clojure-mode-hook          #'enable-paredit-mode))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Move Text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package move-text
  :ensure t)
(global-set-key (kbd "<M-up>") 'move-text-up)
(global-set-key (kbd "<M-down>") 'move-text-down)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Lisp Mode / IELM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package lisp-mode
  :config
  (defun bozhidar-visit-ielm ()
    "Switch to default `ielm' buffer.
Start `ielm' if it's not already running."
    (interactive)
    (crux-start-or-switch-to 'ielm "*ielm*"))
  (add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
  (define-key emacs-lisp-mode-map (kbd "C-c C-z") #'bozhidar-visit-ielm)
  (define-key emacs-lisp-mode-map (kbd "C-c C-c") #'eval-defun)
  (define-key emacs-lisp-mode-map (kbd "C-c C-b") #'eval-buffer)
  (add-hook 'lisp-interaction-mode-hook #'eldoc-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode))
(use-package ielm
  :config
  (add-hook 'ielm-mode-hook #'eldoc-mode)
  (add-hook 'ielm-mode-hook #'rainbow-delimiters-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CIDER / Clojure
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package clojure-mode
  :ensure t
  :config
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode))

(use-package cider
  :ensure t
  :config
  (setq nrepl-log-messages t)
  (add-hook 'cider-repl-mode-hook #'paredit-mode)
  (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Uniquify
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Uniquify buffers names
(use-package uniquify
  :config
  (setq
   uniquify-buffer-name-style 'post-forward
   uniquify-after-kill-buffer-p t
   uniquify-ignore-buffers-re "^\\*"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PDF TOOLS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package pdf-tools
;;   :ensure t
;;   :config
;;   (custom-set-variables
;;    '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead in the mac
;;   (if (eq system-type 'darwin)
;;   (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo")
;;   (setq pdf-info-epdfinfo-program "/usr/bin/epdfinfo"))
;;   (pdf-tools-install))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package clojure-snippets)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Spacemacs Modeline
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package spaceline
:ensure t)

(use-package spaceline-config
:ensure spaceline
:config
(spaceline-emacs-theme))

(use-package spaceline-all-the-icons
:ensure t
:after spaceline
:config
(spaceline-all-the-icons-theme)
(spaceline-all-the-icons--setup-package-updates)
(spaceline-all-the-icons--setup-git-ahead)
(setq-default spaceline-all-the-icons-separator-type 'arrow))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Golden Ratio -> Zoom
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package zoom
;;   :ensure t
;;   :config (zoom-mode 1))
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(company-frontends
;;    (quote
;;     (company-pseudo-tooltip-unless-just-one-frontend-with-delay company-pseudo-tooltip-unless-just-one-frontend-with-delay)))
;;  '(elpy-rpc-backend "jedi" t)
;;  '(nyan-animate-nyancat t t)
;;  '(nyan-cat-face-number 4 t)
;;  '(package-selected-packages
;;    (quote
;;     (zoom fancy-battery spaceline-all-the-icons spaceline jedi elpy lsp-ui ivy-filthy-rich nyan-mode yasnippet which-key use-package swiper-helm smooth-scrolling rainbow-identifiers rainbow-delimiters pdf-tools paredit org-bullets neotree move-text magit lsp-python line-reminder ivy-rich helm-projectile helm-fuzzier helm-ag evil doom-themes doom-modeline diminish diff-hl counsel company-lsp cider challenger-deep-theme anzu all-the-icons-ivy)))
;;  '(pdf-tools-handle-upgrades nil)
;;  '(safe-local-variable-values (quote ((encoding . utf-8))))
;;  '(zoom-size (quote (0.618 . 0.618))))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Web Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))



;; ***********************************************************************
;; ***********************************************************************
;; ************************* GLOBAL KEY BINDING **************************
;; ***********************************************************************
;; ***********************************************************************


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                         GLOBAL KEY BINDING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Text Scale
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-set)

;; Copy Line
(global-set-key (kbd "C-c l") 'my/copy-line)

;; Config Visit
(global-set-key (kbd "C-c e") 'my/config-visit)

;; Reload Config
(global-set-key (kbd "C-c r") 'my/reload-init-file)

;; Clean WhiteSpace
(global-set-key (kbd "C-c DEL") 'whitespace-cleanup)

(global-set-key (kbd "C-c /") 'split-window-right)
(global-set-key (kbd "C-c -") 'split-window-below)


;; ***********************************************************************
;; ***********************************************************************
;; **************************** MY FUNCTIONS *****************************
;; ***********************************************************************
;; ***********************************************************************
;; Copy Whole Line
(defun my/copy-line (arg)
  (interactive "p")
  (kill-ring-save (line-beginning-position)
		  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

;; Show Whitespace
(defun my/buf-show-trailing-whitespace ()
  (interactive)
  (setq show-trailing-whitespace t))
(add-hook 'prog-mode-hook 'my/buf-show-trailing-whitespace)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((t (:background "red")))))

(defun my/reload-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))


;; Emacs Config
(defun my/config-visit ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (clojure-snippets counsel yasnippet which-key use-package))))

