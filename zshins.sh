echo "Already have Oh-My-Zsh installed? (y/n)"
read answer
sleep 1 && clear

case $answer in
  [Yy]*)
    if [ -L $HOME/.config/zsh ]; then
    rm $HOME/.config/zsh
    fi
    ln -sfv $path/.config/zsh $HOME/.config/zsh 

    if [ -L $HOME/.zshrc ]; then
    rm $HOME/.zshrc
    fi
    sleep 1 && clear
    ;;
  [Nn]*)
    echo "Installing..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    if [ -L $HOME/.config/zsh ]; then
    rm $HOME/.config/zsh
    mv $path/.config/zsh/.zshrc.pre-oh-my-zsh $path/.config/zsh/.zshrc
    fi
    ln -sfv $path/.config/zsh $HOME/.config/zsh 

    if [ -f $HOME/.zshrc ]; then
    rm $HOME/.zshrc
    fi
    sleep 1 && clear
    ;;
  *)
    echo "Invalid answer, skipping..."
    sleep 1 && clear
    ;;
esac
