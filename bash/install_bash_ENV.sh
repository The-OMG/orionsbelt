mkdir $HOME/.bk
mv $HOME/.bashrc $HOME/.bk/.bashrc
mv ./files/ $HOME/
echo "Existing bash files moved to $HOME/.bk"
echo "type in "bash" and press enter to enter new environment"