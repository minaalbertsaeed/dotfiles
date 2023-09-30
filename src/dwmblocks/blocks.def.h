//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
  {"", "xkblayout-state print \"%s\" " ,0, 30},
  {"Br: ", "light -G | cut -d'.' -f1", 0, 25},
	{"Mem: ", "free -h | awk 'NR==2{print $3}' | tr -d 'Gi'",	5,		0},
  {"GPU: ", "nvidia-settings -q gpucoretemp -t", 5, 0},
  {"Vol: ", "pamixer --get-volume", 0, 20},
  {"BAT: ", "cat /sys/class/power_supply/BAT0/capacity", 5, 0},
  {"", " nmcli -t -f active,ssid dev wifi | grep yes | cut -d: -f2", 2, 0},
	{"", "date '+ %a %b %d %r'  ",					1,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
