;;; init-ido.el --- initialize the ido -*- lexical-binding: t -*-
;; Author: chuanzhangjiang
;; Maintainer: chuanzhangjiang
;; Version: 1.0
;; Package-Requires: ()
;; Homepage: https://github.com/chuanzhangjiang
;; Keywords:

;;; Commentary:
;; (c) chuanzhangjaing, 2020-2021

;;; Code:

;; ibuffer
(use-package ibuffer
  :init (defalias 'list-buffers 'ibuffer))

;; Ido ( instead of ivy & counsel & swiper)
(setq-default ido-auto-merge-work-directories-length -1
	      ido-enable-flex-matching t
	      isearch-lazy-count t
	      lazy-count-prefix-format "%s/%s: ")
(setq completion-ignored-extensions '(".o" ".elc" "~" ".bin" ".bak" ".obj" ".map" ".a" ".ln" ".class"))
(fido-mode t)

(provide 'init-ido)

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
;;; init-ido.el ends here

