#!/bin/bash
sudo su
cd || exit

read -p "Bitch do you want me to style your setup? ;)" STYLE

#Basic tools
apt update -y
apt install -y build-essential clang git kitty zsh nodejs

#Brave browser
apt install -y apt-transport-https curl gnupg
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc |  apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" |  tee /etc/apt/sources.list.d/brave-browser-release.list
apt update -y &&  apt install -y brave-browser

#Python
apt install -y software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt update -y &&  apt install -y python3.8
apt install -y python3-pip

#ccls
snap install ccls --classic

#Spotify
snap install spotify

#VSCode
snap install code --classic

#NVIM
snap install nvim --classic

#Kitty setup
cp -r ~/dotfiles/kitty ~/.configs

case $STYLE in 
  "y" | "Y" | "yes" | "YES")

    echo "Styling everything awww yes"
    #Oh my zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    #Dein for nvim
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh && sh ./installer.sh ~/.cache/dein
    
    #nvim configs
    cp -r ~/dotfiles/nvim ~/.configs
    ;;
esac

echo "Done!"

