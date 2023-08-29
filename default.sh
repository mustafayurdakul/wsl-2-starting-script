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
echo "## [UPDATE SCRIPT MESSAGE]:	Node Lastest installing..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	ZSH installing..."
sudo apt-get install zsh -y

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	Changing default shell to Zsh.."
[ $SHELL == /usr/bin/zsh ] && echo "Zsh is already default shell for that user."
[ $SHELL != /usr/bin/zsh ] && echo "Current shell path is: " $SHELL", password may be need for changing to zsh."
[ $SHELL != /usr/bin/zsh ] && chsh -s $(which zsh)

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	Zsh configuration executing..."
echo "# Lines configured by zsh-newuser-install" > .zshrc
echo "HISTFILE=~/.histfile" >> .zshrc
echo "HISTSIZE=10" >> .zshrc
echo "SAVEHIST=10" >> .zshrc
echo "# End of lines configured by zsh-newuser-install" >> .zshrc
echo "Hist configuration added."

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	GitHub global configuration setup... "
IFS= read -r -p  "Enter your GitHub e-mail address (example@github.com): " userEmail
IFS= read -r -p  "Enter your GitHub Name (Mustafa Yurdakul): " userName
git config --global user.name "$userName"
git config --global user.email "$userEmail"

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	GitHub creating new SSH key."

if [ -d "$HOME/.ssh/" ]
then
  echo "There is already SSH key in home directory."
  echo "You can add your SSH key from https://github.com/settings/keys. "
  cat ~/.ssh/id_ed25519.pub
else 
  echo "There is no SSH key in home directory."
  echo "Creating SSH key..."
  ssh-keygen -t ed25519 -C "$userEmail"
  echo "SSH key created, you can add your SSH key from https://github.com/settings/keys. "
  echo "For test SSH connection with your key: ssh -T git@github.com"
  cat ~/.ssh/id_ed25519.pub
fi

echo ""
echo ""
echo "## [UPDATE SCRIPT MESSAGE]:	Finished."
