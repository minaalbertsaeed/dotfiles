# My Linux System Setup

This is the configuration of my Arch linux System using [DWM](https://dwm.suckless.org/) (Xorg)

## Common Packages
- Window Manager : dwm
- Terminal Multiplexer: tmux
- Text Editor: nvim
- Image Viewer: sxiv
- Video Player: mpv with a gui verison using [uosc](Https://github.com/tomasklaen/uosc)
- Zathura pdf plugin: zathura-pdf-mupdf
- Fonts: ttf-jetbrains-mono-nerd ttf-cairo
- Menu: dmenu 
- Web Browser: brave-bin 
- Recording tool: ffmpeg
- Machine Emulator & Virtualizer : qemu
- Filemanager: lf
- Screenshots: maim
- System Monitor: btop
- Clipboard Manager: xclip, rofi-greenclip
- Backlight Controller: light
- Command line Translator: translate-shell
 
## NOTES:
- Keybindings related to windows and controlling them are located at src/dwm/config.def.h 
- Other keybindings related to the rest of the system are located at .cofig/sxhkd/sxhkdrc 
- Some packages are in the official repositories and other from the AUR (Arch User Repository)
- All the scripts use **/bin/sh** to execute so all of them are **POSIX compliant scripts**
- All the installed packages are listed in .local/share/*pkglist.txt 
