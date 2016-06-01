(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

(autoload #'init-latex "latex")

(add-to-list 'auto-mode-alist '("\\.tex\\'" . #'init-latex) t)

(message "done")
