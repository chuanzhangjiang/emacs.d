;;; init-ivy.el --- initialize the ivy -*- lexical-binding: t -*-
;; Author: chuanzhangjiang
;; Maintainer: chuanzhangjiang
;; Version: 1.0
;; Package-Requires: ()
;; Homepage: https://github.com/chuanzhangjiang
;; Keywords:

;;; Commentary:
;; (c) chuanzhangjaing, 2020-2021

;;; Code:

(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-count-format "%d/%d "
	enable-recursive-minibuffers t
	ivy-re-build-alist '((t . ivy--regex-ignore-order))))

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
		swiper-includ-line-number-in-search t))

(use-package ivy-posframe
  :init
  (setq ivy-posframe-display-functions-alist
      '((complete-symbol . ivy-posframe-display-at-point)
        (counsel-find-file . ivy-display-function-fallback)
        (t               . ivy-posframe-display)))
  ;; (ivy-posframe-mode 1)
  (add-hook 'after-init-hook 'ivy-posframe-mode))

(provide 'init-ivy)

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
;;; init-ivy.el ends here
