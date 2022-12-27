sudo pacman -S vim zsh oh-my-zsh tmux
echo "#################################"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "#################################"
cp -v .zshrc .vimrc .tmux.conf ~
echo "#################################"
echo "Done."
