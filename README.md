# My Linux System Setup

This is the configuration of my Arch linux System using [Suckless](https://suckless.org/) Tools (X server)

## Common Packages
- Window Manager : dwm
- Terminal: st
- Screen locker: slock
- Text Editor: nvim
- Image Viewer: sxiv
- Video Player: mpv, vlc
- Document Viewer: zathura (vim based)
- Zathura pdf plugin: zathura-pdf-mupdf
- Font: ttf-jetbrains-mono-nerd
- Menu: dmenu 
- Web Browser: brave-bin 
- Recording tool: ffmpeg
- Filemanager: lf, thunar
- Notification Daemon: dunst
- Status Bar: dwmblocks
- Screenshots: maim
- System Monitor: btop
- Clipboard Manager: xclip
- Backlight Controller: light
- Command line Translator: translate-shell

## Why using Suckless Tools ?
   Suckless offers bunch of softwares like dwm, st, dmenu, slock and dwmblocks that are very minimal<br> 
   and even don't have configuration files , u need to edit the source code and recompile the software <br> 
   if you want to add a feature then u need to patch the software and recompile it
 
## NOTES:
- All the keybindings related to windows and other ones are located in .config/sxhkd/sxhkdrc
- Some packages are in the official repositories and other from the AUR (Arch User Repository)
