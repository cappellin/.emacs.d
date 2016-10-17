(require 'use-package)
(require 'req-package)

(message "Loading init-darcula")
(req-package darcula-theme
  :loader :elpa)

(provide 'init-darcula)
