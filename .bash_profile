#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

 if [  $(tty) = "/dev/tty1" ] ;then
	 ~/.local/bin/scripts/select_window_manager.sh
 fi
