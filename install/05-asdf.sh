if [ ! -d ~/.asdf ]
then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8
else
    cd ~/.asdf
    git pull --rebase
    cd
fi
