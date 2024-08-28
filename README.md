# My Linux System Setup

This is the configuration of my Arch linux System using [DWM](https://dwm.suckless.org/) (Xorg)

## Common Packages
- Window Manager : `dwm`
- Terminal Multiplexer: `tmux`
- Text Editor: `nvim`
- Image Viewer: `sxiv`
- Video Player: `mpv` with a nice UI using [uosc](https://github.com/tomasklaen/uosc)
- Document Viewer: `zathura`, `sioyek` 
- Zathura pdf plugin: `zathura-pdf-mupdf`
- Fonts: `ttf-victor-mono-nerd` `ttf-cairo`
- Menu: `dmenu` 
- Web Browser: `brave-bin` 
- Recording tool: `ffmpeg`
- Machine Emulator & Virtualizer : `qemu`
- Filemanager: `lf`
- Screenshots: `maim`
- System Monitor: `btop`
- Clipboard Manager: `xclip`, `rofi-greenclip`
- Backlight Controller: `light`
- Command line Translator: `translate-shell`
 
## NOTES:
- Some packages are in the official repositories and others from the AUR (Arch User Repository)
- Most of the scripts use **/bin/sh** to execute so all of them are **POSIX compliant scripts**
- All the installed packages are listed in .local/share/*pkglist.txt 

## Keybindings Design

My system is keyboard-driven, with specific modifiers (Mod keys) reserved for controlling different aspects of the system:

- **Alt**: Used for controlling window management & Spawning programs (dwm & sxhkd).
- **Ctrl + s**: Used as Tmux prefix
- **Space**: Used in Neovim as the leader key
- **Ctrl + Shift**: Used as Mod key in st terminal


As i spend 90% of my time in the temrinal, it's important to notice that working in terminal includes applications that works in different layers:

1. **First Layer: Terminal Emulator (`st`)**
   - st has its own modifier key which is **Ctrl+Shift** as configured in src/st/config.def.h
   - Keybindings in st are generally reserved for basic terminal functions like copying (Mod + y), pasting (Mod + p), scrolling (Mod + j/k).

2. **Second Layer: Shell (`Bash`)**
   - I use custom binds like Ctrl+o to move through directories using [fzf](https://github.com/junegunn/fzf) 
   - Bash itself reserves some keybindings by default, like C-r, C-d, etc.

3. **Third Layer: `Tmux`**
   - I use C-s as my tmux prefix so that it doesn't conflict with any st or Bash keybindings.

4. **Fourth Layer: `Neovim`**
   - I use Space as my main Mod (leader key) in Neovim , take care that vim/neovim has also a keybinds with **Ctrl** like **C-a**, **C-x** ..etc.

Each layer introduces its own keybindings and Mod key. My keybindings are designed to avoid conflicts with these layers


## 1. Window Manager Keybindings

- These keybindings are specific to the window manager [dwm](https://dwm.suckless.org/) and can be found in **src/dwm/config.def.h**
- I use **Alt** as my Mod key 

| **Keybinding**                    | **Action**                    
|---------------------------        |-------------------------------
| `Mod + Enter`                     | Open Terminal (runs .local/scritps/tmux_new_window.sh) 
| `Mod + h/l`                       | Resize windows left & right   
| `Mod + j/k`                       | Cycle through the windows
| `Mod + e`                         | Toggle window as floating
| `Mod + a`                         | Shift focused window to next tag
| `Mod + z`                         | focus in master window
| `Mod + Tab`                       | View last visited workspace
| `Mod + (0-9)`                     | Go to tag (0-9)
| `Mod + Shift + a`                 | Shift focused window to previous tag
| `Mod + Shift + c`                 | Close focused Window          
| `Mod + Shift + b`                 | Toggle dwm bar
| `Mod + Shift + (0-9)`             | Move focused window to tag (0-9)
| `Mod + Shift + h/j/k/l`           | Moves floating windows
| `Mod + Ctrl + Shift + h/j/k/l`    | Moves floating windows

## 2. System-Wide Keybindings

- These keybindings are available across the entire system, excluding those related to dwm 
- They can be found in .config/sxhkd/sxhkdrc, as there are many.

## 3. Terminal Keybindings

This section covers keybindings within terminal environments, including bash, tmux, and Neovim.

### 3.1 st Keybindings
I don’t use all of st keybindings because I rely on tmux features, so there is no need for them.

| **Keybinding**            | **Action**                              
|---------------------------|-----------------------------------------
| `Ctrl + Shift + j/k`      | Scrolls up and down in st
| `Ctrl + Shift + y/p`      | yank and paste

### 3.2 Bash Keybindings

| **Keybinding**  | **Action**                              
|-----------------|-----------------------------------------
| `Ctrl + o`      | Runs fzf_cd which is a funcion defined in .bashrc
| `Ctrl + r`      | Runs fzf_history which is a funcion defined in .bashrc

### 3.2 Tmux Keybindings
- My tmux prefix is **C-s**

| **Keybinding**    | **Action**                
|-------------------|---------------------------
| `prefix + u`      | Create Horizontal Pane           
| `prefix + b`      | Create Vertical Pane        
| `prefix + i`      | Zoom the focused pane
| `prefix + m`      | Runs .local/scripts/tmux_man.sh
| `prefix + r`      | Swap pane with previous pane
| `prefix + p`      | Get last visited window
| `prefix + [`      | Enter copy mode
| `prefix + -`      | Open floating pane
| `prefix + ,`      | Rename current window
| `prefix + R`      | Reload tmux config file (.config/tmux/tmux.conf)
| `prefix + t`      | Runs a tmux pane with fzf to list all URLs in the current window
| `prefix + j/k`    | Move between windows
| `Ctrl + h/j/k/l`  | Move between panes

### 3.3 Neovim Keybindings
- You can find all the keybindings in .config/nvim/lua/mappings.lua, as there are over 50
