;; Seeting
;; Welcome message and Buffer message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
;; Style
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
;; Line number
(global-linum-mode t)
;; Backup
(setq create-lockfiles nil)
(setq backup-directory-alist
      `((".*". ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(semantic-mode 1)

;; More Package
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons"melpa"(concat proto"://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons"melpa-stable"(concat proto"://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives'("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.package.el")
  (require 'use-package))

(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-install package))
  (require package))
(setq use-package-always-ensure t)

(use-package paredit
  :ensure t)
(use-package org)
(use-package helm
  :ensure t)
(use-package helm-gtags)
;(use-package lsp-mode
;  :hook (XXX-mode . lsp)
;  :commands lsp)
;(use-package lsp-ui :commands lsp-ui-mode)
;(use-package company-lsp :commands company-lsp)
;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;(use-package dap-mode)
(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))
(use-package ggtags
  :ensure t
  :defer t
  :init
  (add-hook 'c-mode-common-hook
	    (lambda ()
	      (when (derived-mode-p 'c-mode 'c++-mode)
		(ggtags-mode 1)))))
(use-package ace-window
  :bind ("M-o" . ace-window))
(use-package dracula-theme
  :init
  (load-theme 'dracula t))
(use-package neotree
  :bind ([f8] . 'neotree-toggle))
(use-package imenu-list
  :bind ([f9] . imenu-list-smart-toggle))
(use-package magit
  :ensure t
  :bind (("\C-x g" . magit-status)))
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume))
(use-package swiper
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper))
(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c a") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))
(use-package projectile
  :ensure t
  :bind-keymap ("\C-c p" . projectile-command-map)
  :config
  (projectile-mode t)
  (setq projectile-completion-system 'ivy)
  (use-package counsel-projectile
    :ensure t))
(use-package ag
  :ensure t)
(use-package company
  :bind ("C-c s" . 'counsel-projectile-ag)
  :init
  (global-company-mode))
;(use-package undo-tree
;  :ensure t
;  :config
;  ;; autosave the undo-tree history
;  (setq undo-tree-history-directory-alist
;        `((".*" . ,temporary-file-directory)))
;  (setq undo-tree-auto-save-history t))
(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C-S-w C-S-w") 'mc/mark-all-dwim)
  (global-set-key (kbd "C-S-e C-S-e") 'mc/edit-ends-of-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; language
(use-package go-mode
  :ensure t
  :mode (("\\.go\\'" . go-mode))
  :hook ((before-save . gofmt-before-save))
  :config
  (setq gofmt-command "goimports")
  (use-package company-go
    :ensure t
    :config
    (add-hook 'go-mode-hook (lambda()
                              (add-to-list (make-local-variable 'company-backends)
                                           '(company-go company-files company-yasnippet company-capf))))
    )
  (use-package go-eldoc
    :ensure t
    :hook (go-mode . go-eldoc-setup)
    )
  (use-package go-guru
    :ensure t
    :hook (go-mode . go-guru-hl-identifier-mode)
    )
  (use-package go-rename
    :ensure t)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-rename go-guru go-eldoc company-go go-mode multiple-cursors undo-tree flycheck counsel swiper ivy paredit autopair helm-gtags use-package projectile neotree magit lsp-ui lsp-treemacs imenu-list helm-lsp ggtags dracula-theme dap-mode company-lsp ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
