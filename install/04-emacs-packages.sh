cat <<EOF > /tmp/install-pkg.el
(require 'package) 
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa.org/packages/") t)
(package-refresh-contents)

;;(package-install 'multiple-cursors)
;;(package-install 'scala-mode2)
(package-install 'ensime)
(package-install 'go-mode)
(package-install 'go-autocomplete)
(package-install 'rust-mode)
(package-install 'racer)
EOF

emacs --batch -l /tmp/install-pkg.el
rm /tmp/install-pkg.el
