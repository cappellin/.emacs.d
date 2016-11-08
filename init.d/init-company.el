(require 'use-package)
(require 'req-package)

(req-package company
  :loader :elpa
  :idle
  :config
  (global-company-mode 1)
  (setq company-idle-delay 0.1)
  (global-set-key (kbd "TAB") 'company-indent-or-complete-common)
  )

(provide 'init-company)
