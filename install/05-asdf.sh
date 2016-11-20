# Clone or update autoenv 
if [ ! -d ~/.autoenv ]
then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.0
else
    cd ~/.asdf
    git pull --rebase
    cd
fi
