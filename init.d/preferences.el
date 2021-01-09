(message "Loading preferences")

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
