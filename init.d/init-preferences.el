;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Darcula theme
(load-theme 'darcula t)

;; Default font: Hasklig. I like ligatures!
;; I don't know why but on Mac I must use a bigger font. Px vs Pt?
(if (eq system-type 'darwin)
	(progn
		(set-face-attribute 'default nil :font "Hasklig-12")
		(set-frame-font "Hasklig-12")
	)
	(progn
		(set-face-attribute 'default nil :font "Hasklig-9")
		(set-frame-font "Hasklig-9")
	)
)

;; Show the line number
(global-linum-mode t)

;; Define default encoding to UTF-8
(set-language-environment "UTF-8")

;; Set the backup folder
(if (eq system-type 'darwin)
	(progn
		(setq backup-directory-alist `(("." . "~/Desktop/Black Hole")))
	)
	(progn
		(setq backup-directory-alist `(("." . "d:/temp/emacs_saves")))
	)
)

;; Tab width default
(setq default-tab-width 4)

;; Move point in CamelCase word
(global-subword-mode)

;; Remove trailing spaces when saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-to-list 'auto-mode-alist
			'("\\.xaml\\'" . (lambda ()
			;; add major mode setting here, if needed, for example:
				(xml-mode)
			)))

(provide 'init-preferences)