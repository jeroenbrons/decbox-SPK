Requirements:
1) a copy of bzip2 to extract the image.
2) a working copy of simh
3) an intrest in archaic software.

Getting started:

Obtain a copy of bzip2 and extract the disk image.
Build simh you will only need to build the pdp10 emulator.

put t10.dsk in the same directory as the  pdp10 binary.

Run pdp10 and then follow the following dialog:



Script started on Wed 01 Jan 2003 12:22:49 AM EST
%nice +20 ./pdp10

PDP-10 simulator V2.10-0
sim> set dz 8b
sim> set tim y2k
sim> att rp0 dskb.dsk
sim> att rp1 dskc.dsk
sim> att lp20 printer.out
sim> att -am dz 2020
Listening on port 2020 (socket 5)
Modem control activated
Auto disconnect activated
sim> boot rp
BOOT V3(47)

BOOT>
[Loading from DSKB:SYSTEM.EXE[1,4]]

VNW 10-14-99
Why reload: shced
OPR,PARITY,POWER,STATIC,HARDWARE
NXM,HALT,LOOP,HUNG
PM,CM,SA
NEW,SCHED
OTHER
/H for help
Why reload: sched
Date: 01-jan-2003
Time: 12:24:15

Startup option: quick
[Rebuilding the system search list from the HOMe blocks]

[Rebuilding the active swapping list from the HOMe blocks]

[Rebuilding the system dump list from the HOMe blocks]


VNW 12:24:18 CTY system 4097
Connected to Node (0) Line # 12
.LOGIN 1,2
.R OPSER

[CCPWFD Waiting for file daemon to start]
[OPRPAF Processing auto command file]
?OPRALF LOOKUP failure 0
*
*%%TTY STOMPER - Starting
^C

.kjob
[LGTOUL Other users logged-in under [1,2]]
Job 3  User OPSER  [1,2]
Logged-off CTY  at 12:24:35  on  1-Jan-3
Runtime: 0:00:00, KCS:3, Connect time: 0:00:16
Disk Reads:153, Writes:2, Blocks saved:0
.login public
Job 3  VNW  CTY
%LGNSLE Search list is empty
12:24    1-Jan-3   Wednesday
Welcome to TOPS-10 7.03
Installed software:
BASIC,COBOL(68 and 74), FORTRAN, ALGOL10A
,BLISS-36 V4.2, SORT, RMS, APLSFV2, 
DBMS V5A, IQL3A V30, Message System V11CK

Although the software is installed, not all of it is tested.
and some of it like DBMS and the message system needs to be set up.
refer to the software notebooks and the documents on the
distrobution tape extracted files for the products you need.
at pdp-10.trailing-edge.com

to remove this message login as 1,2 and delete sys:notice.txt

.r haunt


 This is HAUNT. Version 4.6
 See NEWS for news.
 Have you played before?[yes]
*no

  
 Welcome novice.  You are playing on one of the world's largest production
 systems.  The purpose of this game is to find
 treasure in a haunted house and then escape from the house.
  
 The program will give descriptions of locations and accept
 commands to perform actions.
 Give it directives on what to do with simple 1-5 word commands
 Its knowledge of English is limited but imaginative.
 The directions are north, south, east, west,
 up and down.  Directions can be one letter (n,s,e,w,u,d).
 Forward, back, left and right also work.
 To string commands together use 'then'. (eg. west then s)
 It will describe things to you, and a phrase enclosed in '   ' 
 is something it hears.
  
 Special commands: INVEN tells you what you hold.
                   SCORE gives your current score. 
                   STOP ends the adventure.  
                   LOOK describes your current position.
                   NEWS describes new features.
  
 *******************************************************************
 You get 15 points for finding a treasure and 5 points for
 getting it to the lawn outside the house.  You get an extra
 bonus of 20 points for getting your body off the estate.
 The maximum number of points is 440
 Good luck, you'll need it.  Ask for help if you want.
 *******************************************************************
 Copyright (C) 1979, 1980, 1981, 1982 John Laird
 *******************************************************************
  
 On with the adventure!!!
  
  
  
  
  
  
  
  
  
  
 Along time ago, a young couple was picnicing near the woods
 on the outskirts of town.  They were celebrating the birth
 of their first child.  Unfortunately, a crazed moose inhabited that
 area and attacked them.   The child and husband were
 unharmed, but the wife was gored to death by the moose.
  
 After the funeral, the man bought the land where the incident occurred
 and constructed a large mansion: CHEZ MOOSE.  He filled it with
 the treasures of his family and claimed that his wife's
 soul was still in the area.  He vowed to remain in the
 mansion until he had returned her soul to human flesh.
 He tried to bridge the gap between life and death to reclaim her.
 Some say he was insane with grief, but others claimed that the madness was
 in his blood, and his wife's death brought it to the surface.
 After he entered the house, he never returned, and was declared dead 
 seven years later.  Several people have entered the mansion
 looking for him but none of them have ever returned.
 There were rumors that he and his wife now haunt the house.
  
 That would be the end of the story except that the house
 still stands and is filled with priceless treasures.
 The house and all its contents are willed to his only descendant.
 Oh yes, I forgot to tell you, the day the mother was killed,
 the child was stolen by Gypsies.
 The Will claims that only the descendant will know
 how to avoid going crazy and committing suicide
 while spending a night in the mansion.
 An obscure hereditary disease, Orkhisnoires sakioannes,
 is supposed to play some part in this.
  
 So if your heritage is in doubt, you may be the descendant that
 can claim the treasure in the mansion.
 Many people, claiming to be descendants have died trying...
  or at least never returned.
  
 The terms of the Will say you get to keep any treasure
 you get to the lawn, but of course you must also get off the premises alive.
 Because the house is haunted it must be destroyed, and nobody
 would be crazy enough to try and recover the rest of the treasure.
 If you do get out, the government has agreed to
 buy the land and destroy the house.
  
 If you are insane enough to try, your adventure starts at a bus stop.
 Remember, type STOP to end the adventure.
  
 We are at an intersection of two streets going n-s and e-w.
 There is a bus stop here.
 To the west a bus is pulling away from the next bus stop.
  
*stop

 The party's over.
 Your final score is 0
 The total possible is 440
 Hmm... I don't think you tried very hard.
..
.r aplsf

terminal..tty
HI!: PLEASE LET ME KNOW IF APL IS BROKEN
APL-10 DECSYSTEM-10 APLSF 2(435)
CTY) 12:25:16 WEDNESDAY  1-JAN103 PUBLIC [42,42]
CLEAR WS
      )END
 21 INCORRECT COMMAND
      )END
       ^
      )OFF
CTY) 12:27:17  1-JAN103
CONNECTED   0:02:01 CPU TIME   0:00:00
0 STATEMENTS 0 OPERATIONS
KILO-CORE-SECS 4
Job 3  User PUBLIC [42,42]
Logged-off CTY  at 12:27:16  on  1-Jan-3
Runtime: 0:00:07, KCS:1247, Connect time: 0:02:30
Disk Reads:1906, Writes:11, Blocks saved:0
##### This section shows how ot shut down the system ####################
.kjob

.login 1,2
Job 2  VNW  CTY
[LGNJSP Other jobs same PPN]
[LGNLAS Last access to [1,2] succeeded on 31-Dec-2:22:31:54]
12:27    1-Jan-3   Wednesday

.r opr

OPR>
12:24:27 	  -- [SYSTEM]CATALOG error --
		Input error reading DSKB:STRLST.SYS[1,4]; End of file

12:24:27 	  -- [SYSTEM]CATALOG error --
		Input error reading DSKB:MTALST.SYS[1,4]; End of file

12:24:27 	  -- [SYSTEM]CATALOG error --
		Input error reading DSKB:DTALST.SYS[1,4]; End of file

12:24:27 	-- Begin auto take file --
		File: SYS:SYSTEM.CMD[3,3]

12:24:28 	-- End auto take file --
		8 lines processed

12:24:28 	Batch-Stream 0  -- Started --

12:24:28 	Batch-Stream 1  -- Started --

12:24:28 	Batch-Stream 2  -- Started --

12:24:28 	Printer 0  -- Started --
[KOPR>set ksys +0:01
OPR>
12:27:41 	  -- Event KSYS queued, request #5 --

;;SYSTEM: - Timesharing ends in 1 min at  1-Jan-3 12:28:59
[KOPR>
12:27:59 	  -- Timesharing is over --

12:27:59 	  -- KSYS processing completed --
[KOPR>
;;SYSTEM: - Timesharing is over!

OPR>exit

.kjob
[LGTOUL Other users logged-in under [1,2]]
Job 2  User OPERATOR [1,2]
Logged-off CTY  at 12:28:08  on  1-Jan-3
Runtime: 0:00:00, KCS:21, Connect time: 0:00:40
Disk Reads:210, Writes:1, Blocks saved:0
.
Simulation stopped, PC: 000001 (SOJG 6,1)
sim> set fe stop
sim> go
BOOT>
Simulation stopped, PC: 706226 (SKIPN 0,302032)
sim> exit
Goodbye
%exit
script done on Wed 01 Jan 2003 12:28:21 AM EST
