# Clone or update autoenv 
if [ ! -d ~/.autoenv ]
then
    git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
else
    cd ~/.autoenv
    git pull --rebase
    cd
fi
