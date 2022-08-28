(defun helm-jq()
  ""
  (interactive)
  (save-excursion
    (let* ((buffer-string (buffer-substring-no-properties (point-min) (point-max))))
      (with-current-buffer (find-file-noselect "/tmp/.emacs_helm_jq.json")
        (kill-region (point-min) (point-max))
                        (insert buffer-string)
                        (basic-save-buffer)
                        )))
  (helm :sources (helm-build-async-source "JSON"
                   :candidates-process 'helm-jq--make-process
        )))

(defun helm-jq--make-process()
  (start-process "helm-jq-process" nil "jq" "-M" helm-pattern "/tmp/.emacs_helm_jq.json"))
