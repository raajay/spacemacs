;;; packages.el --- my-rtags layer packages file for Spacemacs.

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `my-rtags-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-rtags/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-rtags/pre-init-PACKAGE' and/or
;;   `my-rtags/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-rtags-packages
  '(rtags))

(defun my-rtags/init-rtags ()
  (use-package rtags
    :config
    (setq rtags-autostart-diagnostics t
          rtags-completions-enabled t
          rtags-use-helm t)
    ; See https://github.com/Andersbakken/rtags/issues/832
    (require 'rtags-helm)
    (push '(company-rtags)
          company-backends-c-mode-common)
    (rtags-enable-standard-keybindings)
    (add-hook 'c-mode-common-hook 'rtags-start-process-unless-running))
  (use-package flycheck-rtags
    :ensure rtags))

;;; packages.el ends here
