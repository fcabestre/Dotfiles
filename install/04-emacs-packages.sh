cat <<EOF > /tmp/install-pkg.el
(require 'package) 
(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa.org/packages/") t)
(package-refresh-contents)
(defvar my-packages
  '(go-mode go-autocomplete rust-mode racer multiple-cursors ensime scala-mode2 neotree projectile fiplr)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p))))
EOF

emacs --batch -l /tmp/install-pkg.el
rm /tmp/install-pkg.el
