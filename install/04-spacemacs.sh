if [ -d ~/.emacs.d ]
then
    [ -d .emacs.d.save ] && rm -rf .emacs.d.save
    mv ~/.emacs.d ~/.emacs.d.save
fi

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
