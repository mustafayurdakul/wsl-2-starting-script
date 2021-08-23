echo "## [UPDATE SCRIPT MESSAGE]:	Update executed..."
sudo apt-get update

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	Updates downloading & installing and cleanup..."
sudo apt-get -y dist-upgrade
sudo apt-get -y autoclean
sudo apt-get -y autoremove

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	GIT installing..."
sudo apt-get install git -y

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	CURL installing..."
sudo apt-get install curl -y

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	ZSH installing..."
sudo apt-get install zsh -y

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	Changing default shell to ZSH..."
[ $SHELL == /usr/bin/zsh ] && echo "ZSH is already default shell for that user."
[ $SHELL != /usr/bin/zsh ] && echo "Shell path is: " $SHELL ", password may be need for changing to zsh."
[ $SHELL != /usr/bin/zsh ] && chsh -s $(which zsh)

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	Pure ZSH theme installing..."
mkdir -p "$HOME/.zsh"
[ -d "$HOME/.zsh/pure/" ] && echo "Pure already installed, removing for fresh install."
[ -d "$HOME/.zsh/pure/" ] && sudo rm -r $HOME/.zsh/pure/
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	Pure ZSH theme configuration executing..."
echo "# Lines configured by zsh-newuser-install" > .zshrc
echo "HISTFILE=~/.histfile" >> .zshrc
echo "HISTSIZE=10" >> .zshrc
echo "SAVEHIST=10" >> .zshrc
echo "# End of lines configured by zsh-newuser-install" >> .zshrc
echo "Hist configuration added."

echo "# Lines configured by Pure ZSH Theme" >> .zshrc
echo "fpath+=$HOME/.zsh/pure" >> .zshrc
echo "autoload -U promptinit; promptinit" >> .zshrc
echo "prompt pure" >> .zshrc
echo "# End of lines configured by Pure ZSH Theme" >> .zshrc
echo "Pure theme configuration added."

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	Node 16.x installing..."
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y gcc g++ make

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	Finished."
