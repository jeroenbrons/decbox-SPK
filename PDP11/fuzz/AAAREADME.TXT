RT-11 V05.03
~~~~~~~~~~~~

  Собранная и готовая к работе система RT-11 V05.04 (образ  RK07). В
комплекте SJ, FB и XM мониторы с полным набором  утилит и  основными
драйверами. Прилагается файл ответов SYSGEN и карты памяти.  Системы
пропатчены  на  предмет  y2k.  Также  пропатчен  на  данный  предмет
DIR.SAV. К сожалению PIP.SAV пока не пропатчен.  Системы  собраны  с
поддержкой многотерминальности (1 DZ  мультиплексор,  8  линий), все
терминалы изначально настроены как  SCOPE,  NOCRLF.  Системные  часы
настроены на 50Hz.


Пример конфига для Ersatz-11
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set cpu 45
set hz 50
set idle release

assign yz0: con2:
assign yz1: con3:
assign yz2: con4:
assign yz3: con5:

mou dm0: rt11v503

boo/rt dm0:


Пример конфига для SIMH
~~~~~~~~~~~~~~~~~~~~~~~

set cpu 11/45
set clk 50hz

set tti 8b
set tto 8b

att dz 2023

att hk0 rt11v503.dsk

boo hk0


Каталог диска
~~~~~~~~~~~~~

 Volume ID: RT11V503
 Owner    : FORM
SWAP  .SYS    27P 26-Jan-1999    RT11FB.SYS   103P 26-Jan-1999
RT11SJ.SYS    88P 26-Jan-1999    RT11XM.SYS   116P 26-Jan-1999
RK    .SYS     3P 26-Jan-1999    LP    .SYS     2P 26-Jan-1999
BA    .SYS     7P 26-Jan-1999    VM    .SYS     3P 26-Jan-1999
DL    .SYS     5P 26-Jan-1999    DU    .SYS     8P 26-Jan-1999
DM    .SYS     5P 26-Jan-1999    NL    .SYS     2P 26-Jan-1999
MT    .SYS     9P 26-Jan-1999    MM    .SYS     9P 26-Jan-1999
MU    .SYS    13P 26-Jan-1999    LD    .SYS     8P 26-Jan-1999
EL    .SYS     5P 26-Jan-1999    DP    .SYS     3P 26-Jan-1999
SL    .SYS    14P 26-Jan-1999    VMX   .SYS     3P 26-Jan-1999
LDX   .SYS     8P 26-Jan-1999    LPX   .SYS     2P 26-Jan-1999
BAX   .SYS     7P 26-Jan-1999    DLX   .SYS     5P 26-Jan-1999
DUX   .SYS     9P 26-Jan-1999    DMX   .SYS     5P 26-Jan-1999
RKX   .SYS     3P 26-Jan-1999    MTX   .SYS     9P 26-Jan-1999
MMX   .SYS    10P 26-Jan-1999    MUX   .SYS    15P 26-Jan-1999
NLX   .SYS     2P 26-Jan-1999    DPX   .SYS     3P 26-Jan-1999
SLX   .SYS    16P 26-Jan-1999    PIP   .SAV    30P 26-Jan-1999
DUP   .SAV    47P 26-Jan-1999    DIR   .SAV    19P 26-Jan-1999
IND   .SAV    56P 26-Jan-1999    RESORC.SAV    25P 26-Jan-1999
EDIT  .SAV    19P 26-Jan-1999    K52   .SAV    54P 26-Jan-1999
KED   .SAV    58P 26-Jan-1999    KEX   .SAV    53P 26-Jan-1999
MACRO .SAV    61P 26-Jan-1999    CREF  .SAV     6P 26-Jan-1999
LINK  .SAV    49P 26-Jan-1999    LIBR  .SAV    24P 26-Jan-1999
FILEX .SAV    22P 26-Jan-1999    SRCCOM.SAV    26P 26-Jan-1999
BINCOM.SAV    24P 26-Jan-1999    SLP   .SAV    13P 26-Jan-1999
DUMP  .SAV     9P 26-Jan-1999    SIPP  .SAV    21P 26-Jan-1999
BUP   .SAV    50P 26-Jan-1999    PAT   .SAV    10P 26-Jan-1999
HELP  .SAV   132P 26-Jan-1999    BATCH .SAV    26P 26-Jan-1999
ERROUT.SAV    18P 26-Jan-1999    QUEMAN.SAV    15P 26-Jan-1999
FORMAT.SAV    24P 26-Jan-1999    SETUP .SAV    41P 26-Jan-1999
VTCOM .SAV    24P 26-Jan-1999    SPEED .SAV     4P 26-Jan-1999
DATIME.SAV     4P 26-Jan-1999    LET   .SAV     5P 26-Jan-1999
SPLIT .SAV     3P 26-Jan-1999    UCL   .SAV    15P 26-Jan-1999
VBGEXE.SAV    16P 26-Jan-1999    TERMID.SAV     3P 26-Jan-1999
TRANSF.SAV    16P 26-Jan-1999    GIDIS .SAV    72P 26-Jan-1999
MDUP  .SAV    20P 26-Jan-1999    CONFIG.SAV     7P 26-Jan-1999
ELINIT.SAV     7P 26-Jan-1999    QUEUE .REL    14P 26-Jan-1999
RTMON .REL     8P 26-Jan-1999    SPOOL .REL    11P 26-Jan-1999
VTCOM .REL    27P 26-Jan-1999    ERRLOG.REL     9P 26-Jan-1999
SYSMAC.SML    60P 26-Jan-1999    SYSLIB.OBJ    54P 26-Jan-1999
ODT   .OBJ     8P 26-Jan-1999    VDT   .OBJ     8P 26-Jan-1999
ODTHWD.OBJ     8P 26-Jan-1999    MDUP  .MM     56P 26-Jan-1999
MDUP  .MS     56P 26-Jan-1999    MDUP  .MT     56P 26-Jan-1999
MBOOT .BOT     1P 26-Jan-1999    MBOT16.BOT     1P 26-Jan-1999
MSBOOT.BOT     3P 26-Jan-1999    CUSTOM.TXT     9P 26-Jan-1999
V5NOTE.TXT    41P 26-Jan-1999    SYSGEN.ANS     9P 26-Jan-1999
RT11SJ.MAP    29P 26-Jan-1999    RT11FB.MAP    36P 26-Jan-1999
RT11XM.MAP    39P 26-Jan-1999    STARTF.COM     1  26-Jan-1999
STARTS.COM     1  26-Jan-1999    STARTX.COM     1  26-Jan-1999
 98 Files, 2201 Blocks
 51455 Free blocks
