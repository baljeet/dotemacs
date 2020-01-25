;;Configuring package.el to include Melpa, elpa and org repos
(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/")  t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(when (member "Source Code Pro" (font-family-list)) (set-frame-font "Source Code Pro-16" t t))
(package-initialize)

;; Ensure that use-package is installed.
;; If use-package isn't installed, install it because rest of the
;; packages depend on it.
;; Rest of the packages with configuration are in the literate config
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;;Took inspiration for this from multiple dotemacs files on github
(org-babel-load-file "~/.emacs.d/configuration.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(helm-config smartparens-config auto-compile yasnippet-snippets xref-js2 whole-line-or-region web-mode vue-mode use-package synosaurus smartparens rjsx-mode orgnav org-starter org-protocol-jekyll org-pomodoro org-plus-contrib org-drill org-clock-today org-bullets org-brain orca neotree magit lsp-ui js2-refactor ido-vertical-mode idle-org-agenda helm-projectile go-mode flycheck exec-path-from-shell emmet-mode doom-themes doom-modeline counsel-org-clock counsel-org-capture-string company-tern company-lsp cherry-blossom-theme berrys-theme all-the-icons-dired)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
