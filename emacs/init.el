;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Kerem Vatandas - Emacs Dotfiles                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Prefer newer non-byte compiled sources
(setq load-prefer-newer t)

;; Increase garbage collection threshold
(setq gc-cons-threshold (* 100 1024 1024)
      gc-cons-percentage 0.6)

;; Basic UI settings
(setq frame-resize-pixelwise t
      inhibit-startup-buffer-menu t
      inhibit-startup-screen t
      initial-scratch-message nil
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)

;; Remove UI elements
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Package management setup
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; Install use-package if needed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; Personal info
(setq user-full-name "Kerem Vatandas"
      user-mail-address "keremvatandas@gmail.com")

;; Default encoding
(set-default-coding-systems 'utf-8)

;; Font setup
(defun set-font-if-exists (font-list)
  "Try fonts in FONT-LIST in order, use first available."
  (let ((chosen-font
         (catch 'found-font
           (dolist (font font-list)
             (when (find-font (font-spec :name font))
               (throw 'found-font font))))))
    (when chosen-font
      (set-frame-font chosen-font nil t))))

(set-font-if-exists '("Fira Code 12" "Agave Nerd Font 12"))

;; Import PATH from shell
(let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path (append (split-string-and-unquote path ":") exec-path)))

;; Basic editor settings
(setq-default
 enable-recursive-minibuffers t
 large-file-warning-threshold 100000000
 auto-window-vscroll nil)

(fset 'yes-or-no-p 'y-or-n-p)
(put 'narrow-to-region 'disabled nil)

;; Line/column numbers
(line-number-mode 1)
(column-number-mode 1)

;; Backup settings
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

;; Core packages
(use-package dash)
(use-package diminish)

;; Theme
(use-package challenger-deep-theme
  :config
  (load-theme 'challenger-deep t))

;; Window navigation
(use-package windmove
  :bind (("C-c <right>" . windmove-right)
         ("C-c <left>" . windmove-left)
         ("C-c <up>" . windmove-up)
         ("C-c <down>" . windmove-down)))

;; Development tools
(use-package magit
  :bind ("C-x g" . magit-status))

(use-package company
  :config
  (setq company-idle-delay 0
        company-minimum-prefix-length 1
        company-tooltip-align-annotations t))

(use-package flycheck)

;; Search/completion
(use-package counsel
  :after ivy
  :config (counsel-mode)
  :bind (("M-x" . counsel-M-x)
         ("C-s" . swiper)
         ("C-x C-f" . counsel-find-file)
         ("C-x b" . ivy-switch-buffer)))

(use-package ivy
  :diminish
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-height 20
        ivy-count-format "%d/%d "))

;; UI enhancements
(use-package which-key
  :diminish
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(show-paren-mode 1)

;; Programming modes
(use-package go-mode
  :hook ((go-mode . lsp-deferred)
         (before-save . lsp-format-buffer)
         (before-save . lsp-organize-imports)))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-prefer-flymake nil))

(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-enable nil))

;; Global keybindings
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-set)
(global-set-key (kbd "C-c /") 'split-window-right)
(global-set-key (kbd "C-c -") 'split-window-below)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-ui which-key counsel smooth-scrolling rainbow-identifiers rainbow-delimiters paredit org-bullets nyan-mode neotree move-text magit lsp-mode line-reminder ivy-rich go-mode flycheck diminish diff-hl company challenger-deep-theme anzu all-the-icons-ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
