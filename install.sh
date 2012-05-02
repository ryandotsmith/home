#sh
echo '[ -r $HOME/.bashrc ] && source $HOME/.bashrc' >> ~/.bash_profile
ln -s  ~/src/home/bashrc .bashrc
ln -s  ~/src/home/vimrc .vimrc
ln -s  ~/src/home/vim/ .vim
ln -s  ~/src/home/tmux.conf/ .tmux.conf
