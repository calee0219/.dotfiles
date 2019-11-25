;;; c.el --- c/cpp mode                              -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Chia-An Lee

;; Author: Chia-An Lee <calee@cs.nctu.edu.tw>
;; Keywords: c, lisp

;;; Commentary:
;;
;;; Code:

(use-package irony
  :ensure t
  :hook ((c++-mode . irony-mode)
         (c-mode . irony-mode))
  :config
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (use-package company-irony-c-headers
    :ensure t)
  (use-package company-irony
    :ensure t
    :config
    (add-to-list (make-local-variable 'company-backends)
                 '(company-irony company-irony-c-headers)))
  (use-package flycheck-irony
    :ensure t
    :config
    (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
    )
  (use-package irony-eldoc
    :ensure t
    :config
    (add-hook 'irony-mode-hook #'irony-eldoc)
    )
  )


(use-package rtags
  :ensure t
  :bind ("M-p" . pop-tag-mark)
  :config
  (rtags-enable-standard-keybindings)
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics)
  (setq rtags-completions-enabled t)
  (define-key c-mode-base-map (kbd "M-.")
    (function rtags-find-symbol-at-point))
  (define-key c-mode-base-map (kbd "M-,")
    (function rtags-find-references-at-point))
  )


(use-package cmake-ide
  :ensure t
  :config
  (cmake-ide-setup)
  )


(provide 'c)
;;; c.el ends here
