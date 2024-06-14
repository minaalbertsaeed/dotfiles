/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int gappx     = 3;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 1;    /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 4;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;        /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const int splitstatus        = 0;        /* 1 for split status items */
static const char *splitdelim        = ";";       /* Character used for separating status */
static const char *fonts[]          = { 
    "JetBrains Mono Nerd Font:size=10",

}; 
static const char dmenufont[]       = "JetBrains Mono Nerd Font:size=10";
static const char col_gray1[]       = "#161616";
static const char col_gray2[]       = "#555555"; 
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#008cc4";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	// [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeNorm] = { col_gray4, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_gray2,  col_cyan},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
    /* class                    instance                title           tags mask     switchtotag    isfloating   monitor */
    { "st-256color"             ,NULL ,                 NULL,           1 << 0,            1,           0,          -1 },
    { "Brave-browser"           ,NULL ,                 NULL,           1 << 1,            1,           0,          -1 },
    { "Brave-browser"           ,NULL ,                 "ChatGPT",      1 << 2,            1,           0,          -1 },
    { "Zathura"                 ,NULL ,                 NULL,           1 << 3,            1,           0,          -1 },
    { "mpv"                     ,NULL ,                 NULL,           1 << 4,            1,           0,          -1 },
    { "libreoffice"             ,NULL ,                 NULL,           1 << 5,            1,           0,          -1 },
    { NULL                      ,"excalidraw.com" ,     "Excalidraw",   1 << 6,            1,           0,          -1 },
	{ "qemu-system-x86_64"      ,NULL,                  NULL,           1 << 7,            1,           0,          -1 },
	{ "vesktop"                 ,NULL,                  NULL,           1 << 8,            1,           0,          -1 },
    { "PacketTracer"            ,NULL,                  NULL,           1 << 9,            1,           0,          -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int attachbelow = 1;    /* 1 means attach after the currently active window */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-i",/* ,"-m", dmenumon, */ "-fn", dmenufont, /* "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4 ,*/ NULL };
static const char *termcmd[]  = { "st", NULL };

static const Key keys[] = {
	/* modifier                             key             function            argument */
    { MODKEY,                               XK_e,           togglefloating,     {0} },
    { MODKEY,                               XK_a,           shiftviewclients,   { .i = +1 } },         
	// { MODKEY,                               XK_p,           spawn,              {.v = dmenucmd } },
	{ MODKEY,                               XK_j,           focusstack,         {.i = +1 } },
	{ MODKEY,                               XK_k,           focusstack,         {.i = -1 } },
	{ MODKEY,                               XK_h,           setmfact,           {.f = -0.05} },
	{ MODKEY,                               XK_l,           setmfact,           {.f = +0.05} },
	{ MODKEY,                               XK_z,           zoom,               {0} },
	{ MODKEY,                               XK_Tab,         view,               {0} }, 
    { MODKEY,                               XK_comma,       focusmon,           {.i = -1 } },
    { MODKEY,                               XK_period,      focusmon,           {.i = +1 } },
    { MODKEY|ShiftMask,                     XK_f,           togglefullscr,      {0} },
	{ MODKEY|ShiftMask,                     XK_h,           setcfact,           {.f = +0.25} },
	{ MODKEY|ShiftMask,                     XK_l,           setcfact,           {.f = -0.25} },
	// { MODKEY|ShiftMask,                     XK_o,           setcfact,           {.f =  0.00} },

	{ MODKEY|ShiftMask,                     XK_backslash,   shiftviewclients    , { .i = -1 } },
    { MODKEY|ShiftMask,                     XK_b,           togglebar,          {0} },
    { MODKEY|ShiftMask,                     XK_period,      tagmon,             {.i = +1 } },
	{ MODKEY|ShiftMask,                     XK_c,           killclient,         {0} },
    { MODKEY|ShiftMask,                     XK_k,           pushup,             {0} },
    { MODKEY|ShiftMask,                     XK_j,           pushdown,           {0} },
    { MODKEY|ShiftMask,                     XK_comma,       tagmon,             {.i = -1 } },
    { MODKEY|ShiftMask,					    XK_j,	        moveresize,		    {.v = (int []){ 0, 50, 0, 0 }}},
    { MODKEY|ShiftMask,					    XK_k,		    moveresize,		    {.v = (int []){ 0, -50, 0, 0 }}},
    { MODKEY|ShiftMask,					    XK_h,	        moveresize,		    {.v = (int []){ -50, 0, 0, 0 }}},
    { MODKEY|ShiftMask,					    XK_l,	        moveresize,		    {.v = (int []){ 50, 0, 0, 0 }}},
    { MODKEY|ShiftMask|ControlMask,			XK_j,	        moveresize,		    {.v = (int []){ 0, 0, 0, 25 }}},
    { MODKEY|ShiftMask|ControlMask,			XK_k, 	        moveresize,		    {.v = (int []){ 0, 0, 0, -25 }}},
    { MODKEY|ShiftMask|ControlMask,			XK_l,	        moveresize,		    {.v = (int []){ 0, 0, 25, 0 }}},
    { MODKEY|ShiftMask|ControlMask,			XK_h,	        moveresize,		    {.v = (int []){ 0, 0, -25, 0 }}},
    { MODKEY|ControlMask|ShiftMask, XK_q,      quit,           {1} },  // restart Signal
    // { MODKEY|ShiftMask,             XK_q,      quit,           {0} },  // Quit dwm
	TAGKEYS(                                XK_1,                      0)
	TAGKEYS(                                XK_2,                      1)
	TAGKEYS(                                XK_3,                      2)
	TAGKEYS(                                XK_4,                      3)
	TAGKEYS(                                XK_5,                      4)
	TAGKEYS(                                XK_6,                      5)
	TAGKEYS(                                XK_7,                      6)
	TAGKEYS(                                XK_8,                      7)
	TAGKEYS(                                XK_9,                      8)
	TAGKEYS(                                XK_0,                      9)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
    { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

