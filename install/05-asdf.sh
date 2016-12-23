# Clone or update autoenv 
if [ ! -d ~/.asdf ]
then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.0
else
    cd ~/.asdf
    git pull --rebase
    cd
fi

cd ~/bin
ln -sf ~/.asdf/shims/elixir elixir
ln -sf ~/.asdf/shims/elixirc elixirc
ln -sf ~/.asdf/shims/erl erl
ln -sf ~/.asdf/shims/iex iex
ln -sf ~/.asdf/shims/mix mix
cd
