(defun str-join-with (sep rest)
  (mapconcat 'identity rest ","))

(defun latex-fmt-derivative (cmd arg)
  (apply #'(lambda (cmd arg opt)
             (format "\\%s%s{%s}\n" cmd
                     (if opt
                         (format "[%s]" (str-join-with "," opt)) "")
                     arg))
         (if (listp arg)
             (list cmd (car arg) (cadr arg))
           (list cmd arg nil))))


(defun latex-begin ()
  '(("documentclass" . "article")))

(defun latex-headers ()
  (mapcar (lambda (p) `("usepackage" . ,p))
          `("amsthm"
            "amsmath"
            "amssymb"
            "enumerate"
            "color"
            ("hyperref"
             ,(cons "colorlinks"
                    (mapcar (lambda (p) (apply #'format "%s=%s" p))
                            '(("citecolor" "black")
                              ("filecolor" "black")
                              ("linkcolor" "black")
                              ("urlcolor" "black")
                              ("colorlinks" "true")
                              ("linktoc" "all")
                              ("linkcolor" "blue")
                              ("linktocpage" "true")))))
            "minitoc")))

(defun latex-body ()
  (mapcar (lambda (p) `(,p . "document")) '("begin" "end")))

(defun latex-tpl ()
  (mapcar (lambda (p) (latex-fmt-derivative (car p) (cdr p)))
          (append (latex-begin)
                  (latex-headers)
                  (latex-body))))


(defun init-latex ()
  "Add the latex headers"
  (interactive)

  (let ((tmp (generate-new-buffer "tmp")))
    (princ (apply #'concat (latex-tpl)) tmp)
    (princ (buffer-string) tmp)
    (buffer-swap-text tmp)
    (kill-buffer tmp))
  (save-buffer)
  (message "done"))
