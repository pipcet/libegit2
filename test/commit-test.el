(ert-deftest commit-lookup ()
  (with-temp-dir path
    (init)
    (commit-change "test" "content")
    (let* ((repo (libgit-repository-open path))
           (id (libgit-reference-name-to-id repo "HEAD"))
           (commit (libgit-commit-lookup repo id)))
      (should (libgit-commit-p commit))
      (should (string= id (libgit-commit-id commit)))
      (should-error (libgit-commit-lookup repo "test") :type 'giterr))))
