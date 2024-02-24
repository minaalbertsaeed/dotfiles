//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
    // {"", "[ -f /tmp/record ] && echo \"Recording\" || echo \" \"", 0, 10},
    // {"", "/home/mina/scripts/test.sh", 0, 10},
    {"", "~/.local/scripts/check_screencast_status.sh" ,0, 15},
    {"", "xkblayout-state print \"%s\" " ,0, 30},
    {"", "~/.local/scripts/get_mic_status.sh" ,0, 10},
    {"Vol: ", "~/.local/scripts/get_sound_status.sh", 0, 20},
    {"MEM: ", "free -h | awk 'NR==2{print $3}' | tr -d 'Gi'",	1,		0},
    {"BR: ", "light -G | cut -d'.' -f1", 0, 25},
    {"BAT: ", "cat /sys/class/power_supply/BAT0/capacity", 2, 0},
    {"", "nmcli -t -f NAME connection show --active | head -n 1", 1, 0},
    {"", "date '+ %a %b %d %r' ",					1,		0},
};

// {"GPU: ", "nvidia-settings -q gpucoretemp -t", 5, 0},
// {"CPU: ", "top -bn1 | grep \"Cpu()\" | awk '{print $2 + $4}'", 2, 0},
//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
