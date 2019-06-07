;; elpa

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https//orgmode.org/elpa/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))

;; disable a single keypress of Windows key
;; https://emacs.stackexchange.com/questions/48720/disable-left-win-key-in-emacs-for-windows
(setq w32-pass-lwindow-to-system nil)

(defconst my-init-dir "~/.emacs.d/init.d")
(defconst emacs-major-version-rad 1000000)

(defun has-emacs-version (major minor)
  (<= (+ (* major emacs-major-version-rad) minor)
      (+ (* emacs-major-version emacs-major-version-rad) emacs-minor-version)))

(eval-when-compile (package-initialize))

(defun require-package (package)
  "refresh package archives, check package presence and install if it's not installed"
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
                                  (progn (package-refresh-contents)
                                         package-archive-contents)
                                package-archive-contents))
                    (AVAIL (assoc package ARCHIVES)))
               (if AVAIL
                   (package-install package)))
             (require package))))

;; use package

(require-package 'use-package)
(require 'use-package)

(require-package 'req-package)
(require 'req-package)
(req-package--log-set-level 'debug)

(random t)
(req-package load-dir
  :ensure t
  :force true
  :init
  (setq force-load-messages nil)
  (setq load-dir-debug nil)
  (setq load-dir-recursive t)
  :config
  (load-dir-one my-init-dir)
  (req-package-finish)
  (funcall 'select-theme))
