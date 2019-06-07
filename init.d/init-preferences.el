(require 'req-package)

(message "Loading init-preferences")
(req-package init-preferences
  :require init-darcula
  :config

  ;; Display line number
  (global-display-line-numbers-mode)

  ;; Default font: Essential PragmataPro. The best font ever!
  ;; I don't know why but on Mac I must use a bigger font. Px vs Pt?
  (if (eq system-type 'darwin)
    (progn
      (set-face-attribute 'default nil :font "PragmataPro Liga-12")
      (set-frame-font "Hasklig-12")
    )
      (set-face-attribute 'default nil :font "PragmataPro Liga-10")
      (set-frame-font "Hasklig-10")
  )

  ;; Define default encoding to UTF-8
  (set-language-environment "UTF-8")

  ;; Tab width default
  (setq default-tab-width 4)
  (defun my-c++-mode-hook ()
    ;; customization for c-mode and c++-mode
    (c-set-offset 'substatement-open 0)

    ;; other customizations
    (setq c++-tab-always-indent t)
    (setq c-basic-offset 4)
    (setq c-indent-level 4))
  (add-hook 'c++-mode-hook 'my-c++-mode-hook)

  ;; Move point in CamelCase word
  (global-subword-mode)

  ;; Remove trailing spaces when saving
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  (add-to-list 'auto-mode-alist
         '("\\.xaml\\'" . (lambda ()
          ;; add major mode setting here, if needed, for example:
          (xml-mode)
          )))
  )

  ;; Darcula theme
  (load-theme 'darcula t)

(provide 'init-preferences)
