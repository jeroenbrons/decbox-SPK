
ID DIVISION.
PROGRAM-ID. KEYRMS - RMS/COBOL-74 PROGRAM.

**************************************************************
*                                                            *
*  This program demonstrates the following:                  *
*                                                            *
*    1. The use of RMS with COBOL in order to use RMS        *
*       indexed files.                                       *
*                                                            *
*    2. The use of a DECLARATIVES procedure to trap          *
*       an error (such as error number 508 for File          *
*       not found).                                          *
*                                                            *
*  This program can be keyed in and run to allow you to      *
*  become familiar with using files with more than one key.  *
*                                                            *
**************************************************************

ENVIRONMENT DIVISION.
I-O SECTION.
FILE-CONTROL.

**************************************************************
*                                                            *
*  To specify that the file is an RMS indexed file, you      *
*  can either specify "ORGANIZATION IS RMS INDEXED" or       *
*  "ALTERNATE RECORD KEY IS" or both.                        *
*                                                            *
*  This example indicates to the compiler that you want      *
*  an RMS indexed file.                                      *
*                                                            *
**************************************************************

	SELECT	RMS-INDEX-FILE ASSIGN TO DSK
		ORGANIZATION IS RMS INDEXED
		ACCESS IS DYNAMIC
		RECORDING MODE IS SIXBIT
		FILE STATUS IS FILE-STATUS-1, FILE-STATUS-2,
			IGNORE-FLAG
		RECORD KEY IS EMPLOYEE-NAME
		ALTERNATE RECORD KEY IS EMPLOYEE-NUMBER
			WITH DUPLICATES.

DATA DIVISION.
FILE SECTION.
FD	RMS-INDEX-FILE VALUE OF ID IS "RMSKY RMS".
01	RMS-INDEX-RECORD.
	02	EMPLOYEE-NAME PIC X(10).
	02	FILLER PIC X.
	02	EMPLOYEE-NUMBER PIC 9(6).
WORKING-STORAGE SECTION.

**************************************************************
*                                                            *
*  Establish the File Status errors you want to trap. RMS    *
*  File Status errors numbers are in the range from 500      *
*  to 550.                                                   *
*                                                            *
*  Refer to Chapter 3 for a complete description of RMS      *
*  File Status errors that can be trapped with the USE       *
*  statement.                                                *
*                                                            *
**************************************************************

01	ERR-FILE-NOT-FOUND INDEX VALUE 508.

01	FILE-STATUS-1 PIC 9(2).
01	FILE-STATUS-2 PIC 9(10).
01	FILE-STATUS-2-R REDEFINES FILE-STATUS-2.
	02	FILLER PIC X(7).
	02	FILE-STATUS-2-NUM PIC 9(3).
01	IGNORE-FLAG USAGE INDEX.

**************************************************************
*                                                            *
*  Define the commands that are used in this program to      *
*  work with RMS indexed files.                              *
*                                                            *
**************************************************************

01	COMMAND-WORD.
	02	COMMAND-LETTER PIC X.
		88	COMMAND-A VALUE "A".
		88	COMMAND-C VALUE "C".
		88	COMMAND-D VALUE "D".
		88	COMMAND-H VALUE "H".
		88	COMMAND-P VALUE "P".
		88	COMMAND-R VALUE "R".
		88	COMMAND-T VALUE "T".
		88	COMMAND-U VALUE "U".
		88	COMMAND-W VALUE "W".
	02	COMMAND-LET-2 PIC X.
		88	COMMAND-L2-R VALUE "R".
		88	COMMAND-L2-S VALUE "S".
PROCEDURE DIVISION.

DECLARATIVES.
DECLARE-ERROR SECTION.
	USE AFTER STANDARD ERROR PROCEDURE ON RMS-INDEX-FILE.

**************************************************************
*                                                            *
*  If the program gets an I/O error for RMS-INDEX-FILE,      *
*  this section will be executed. The file status items      *
*  will have been set by LIBOL.                              *
*                                                            *
*  If the error code from LIBOL is "File not found", a       *
*  flag is set. If the error code is not "File not found",   *
*  this procedure does not set the "IGNORE" flag and LIBOL   *
*  aborts this program (as if there were no USE procedure    *
*  at all).                                                  *
*                                                            *
**************************************************************

DECLARE1-1.
	IF FILE-STATUS-2-NUM NOT = ERR-FILE-NOT-FOUND
		GO TO DECLARE1-EXIT.

**************************************************************
*                                                            *
*  The "File not found" error has occurred. Set the file     *
*  status item "IGNORE-FLAG" to ignore the error, and to     *
*  return to the program.                                    *
*                                                            *
**************************************************************

	SET IGNORE-FLAG TO 1.

DECLARE1-EXIT.
	EXIT.
END DECLARATIVES.
BEGIN-RMS-PROGRAM.

	DISPLAY "[COBOL-RMS demonstration program]".

OPEN-RMS-FILE.

**************************************************************
*                                                            *
*  Attempt to open the file for I/O. If the file does not    *
*  exist, the error procedure traps the open error and       *
*  sets the file status item "IGNORE-FLAG" to 1.             *
*                                                            *
**************************************************************

	OPEN I-O RMS-INDEX-FILE.
	IF IGNORE-FLAG NOT = 0
		DISPLAY "[File not found-- creating empty file]"
		OPEN OUTPUT RMS-INDEX-FILE
		CLOSE RMS-INDEX-FILE
		OPEN I-O RMS-INDEX-FILE.

DISPLAY-OPEN-FOR-IO.

	DISPLAY "[File RMSKY.RMS open for I/O]".

**************************************************************
*                                                            *
*  This procedure displays the commands that can be used.    *
*                                                            *
**************************************************************

GET-HELP.

	DISPLAY SPACE.
	DISPLAY "Type command, one of the following:".
	DISPLAY "C = Close file and exit".
	DISPLAY "D = Delete a record".
	DISPLAY "RR = Do a read with random access".
	DISPLAY "RS = Do a read with sequential access".
	DISPLAY "W = Write a new record".
	DISPLAY "U = Update a record (will do a rewrite)".
	DISPLAY "T = Type all records in the file".
	DISPLAY "H = Type this list of commands".
**************************************************************
*                                                            *
*  Enter a command to close, delete, read, write, update,    *
*  or type an RMS record. Enter "H" to get help.             *
*                                                            *
**************************************************************

GET-COMMAND.

	DISPLAY SPACE.
	DISPLAY "COMMAND> " WITH NO ADVANCING.
	ACCEPT COMMAND-WORD.
	IF COMMAND-LETTER = SPACE GO TO GET-COMMAND.
	IF COMMAND-C GO TO CLOSE-RMS-FILE.
	IF COMMAND-D GO TO DELETE-RMS-RECORD.
	IF COMMAND-R GO TO READ-RMS-RECORD.
	IF COMMAND-W GO TO WRITE-RMS-RECORD.
	IF COMMAND-U GO TO UPDATE-RMS-RECORD.
	IF COMMAND-T GO TO TYPE-RMS-RECORD.
	IF COMMAND-H GO TO GET-HELP.

INVALID-COMMAND.

	DISPLAY "?Invalid command, type 'H' for help"
		GO TO GET-COMMAND.

**************************************************************
*                                                            *
*  The C command closes the RMS file and exits from the      *
*  program.                                                  *
*                                                            *
**************************************************************

CLOSE-RMS-FILE.

	CLOSE RMS-INDEX-FILE.
	STOP RUN.

**************************************************************
*                                                            *
*  The D command deletes an RMS record from the file.        *
*                                                            *
**************************************************************

DELETE-RMS-RECORD.

	PERFORM ACCEPT-RECORD-KEY.
	DELETE RMS-INDEX-FILE INVALID KEY
		DISPLAY "?Can't delete record: "
			WITH NO ADVANCING
		PERFORM TYPE-FILE-STATUS
		GO TO GET-COMMAND.
	DISPLAY "[Record deleted]".
	GO TO GET-COMMAND.
**************************************************************
*                                                            *
*  The U command updates an RMS record in the file.          *
*                                                            *
**************************************************************

UPDATE-RMS-RECORD.

	PERFORM ACCEPT-RECORD-KEY.
	READ RMS-INDEX-FILE INVALID KEY
		DISPLAY "?Can't read record: "
			WITH NO ADVANCING
		PERFORM TYPE-FILE-STATUS
		GO TO GET-COMMAND.
	DISPLAY "[Employee number is ",EMPLOYEE-NUMBER,"]".
	PERFORM ACCEPT-ALTERNATE-KEY.
	REWRITE RMS-INDEX-RECORD INVALID KEY
		DISPLAY "?Can't rewrite record: "
			WITH NO ADVANCING
		PERFORM TYPE-FILE-STATUS
		GO TO GET-COMMAND.
	DISPLAY "[Record rewritten]".
	GO TO GET-COMMAND.

**************************************************************
*                                                            *
*  The W command writes a new RMS record in the file.        *
*                                                            *
**************************************************************

WRITE-RMS-RECORD.

	PERFORM ACCEPT-RECORD-KEY.
	PERFORM ACCEPT-ALTERNATE-KEY.
	WRITE RMS-INDEX-RECORD INVALID KEY
		DISPLAY "?Can't write record: "
			WITH NO ADVANCING
		PERFORM TYPE-FILE-STATUS
		GO TO GET-COMMAND.
	DISPLAY "[Record written]".
	GO TO GET-COMMAND.
**************************************************************
*                                                            *
*  The following procedures allow you to either read RMS     *
*  records randomly with the "RR" command or read RMS        *
*  records sequentially with the "RS" command.               *
*                                                            *
**************************************************************

READ-RMS-RECORD.

	IF COMMAND-L2-R GO TO READ-RANDOM-RECORD.
	IF COMMAND-L2-S GO TO READ-SEQUENTIAL.
	GO TO INVALID-COMMAND.

READ-RANDOM-RECORD.

	DISPLAY "Which key? (P = primary, A = alternate): "
			WITH NO ADVANCING.
	ACCEPT COMMAND-LETTER.
	IF COMMAND-P GO TO ACCEPT-PRIMARY-KEY.
	IF COMMAND-A GO TO ACCEPT-SECONDARY-KEY.
	GO TO READ-RANDOM-RECORD.

ACCEPT-PRIMARY-KEY.

	PERFORM ACCEPT-RECORD-KEY.
	READ RMS-INDEX-FILE KEY IS EMPLOYEE-NAME INVALID KEY
		DISPLAY "?Can't read record: "
		PERFORM TYPE-FILE-STATUS
		GO TO GET-COMMAND.
	GO TO DISPLAY-RMS-RECORD.

ACCEPT-SECONDARY-KEY.

	PERFORM ACCEPT-ALTERNATE-KEY.
	READ RMS-INDEX-FILE KEY IS EMPLOYEE-NUMBER
			INVALID KEY
		DISPLAY "?Can't read record: "
		PERFORM TYPE-FILE-STATUS
		GO TO GET-COMMAND.
	GO TO DISPLAY-RMS-RECORD.

READ-SEQUENTIAL.

	READ RMS-INDEX-FILE NEXT RECORD AT END
		DISPLAY "?Can't read next record: "
		PERFORM TYPE-FILE-STATUS
		GO TO GET-COMMAND.
DISPLAY-RMS-RECORD.

	DISPLAY "[Record is:  !" WITH NO ADVANCING.
	DISPLAY RMS-INDEX-RECORD, "!]".
	GO TO GET-COMMAND.

**************************************************************
*                                                            *
*  The T command types all the records in the RMS file.      *
*  This command allows you the option to type the RMS file   *
*  in the order of the primary key or in the order of the    *
*  alternate key.                                            *
*                                                            *
*  The START statement is used here because of the current   *
*  positioning in the file. The current position may or      *
*  may not be the first record in the file.                  *
*                                                            *
**************************************************************

TYPE-RMS-RECORD.

	DISPLAY "In order of which key? " WITH NO ADVANCING.
	DISPLAY "(P = primary, A = alternate): "
		WITH NO ADVANCING.
	ACCEPT COMMAND-LETTER.
	IF COMMAND-P GO TO TYPE-START-PRIMARY.
	IF COMMAND-A GO TO TYPE-START-ALTERNATE.
	GO TO TYPE-RMS-RECORD.

TYPE-START-PRIMARY.

	MOVE LOW-VALUES TO EMPLOYEE-NAME.
	START RMS-INDEX-FILE KEY NOT LESS THAN EMPLOYEE-NAME
		INVALID KEY GO TO TYPE-RMS-RECORD-IK.
	GO TO TYPE-RMS-RECORD-R.

TYPE-START-ALTERNATE.

	MOVE LOW-VALUES TO EMPLOYEE-NUMBER
	START RMS-INDEX-FILE KEY NOT LESS THAN EMPLOYEE-NUMBER
		INVALID KEY GO TO TYPE-RMS-RECORD-IK.
	GO TO TYPE-RMS-RECORD-R.

TYPE-RMS-RECORD-R.

	READ RMS-INDEX-FILE NEXT RECORD AT END GO TO GET-COMMAND.
	DISPLAY RMS-INDEX-RECORD.
	GO TO TYPE-RMS-RECORD-R.

TYPE-RMS-RECORD-IK.

	DISPLAY "% Can't start reading file: " WITH NO ADVANCING.
	PERFORM TYPE-FILE-STATUS.
	GO TO GET-COMMAND.
**************************************************************
*                                                            *
*  This subroutine accepts the primary record key for        *
*  a random read.                                            *
*                                                            *
**************************************************************

ACCEPT-RECORD-KEY SECTION.

ACC-REC-KEY.

	DISPLAY "Type employee name X(10): "
			WITH NO ADVANCING.
	ACCEPT EMPLOYEE-NAME.

ACC-REC-KEY-EXIT.
	EXIT.

**************************************************************
*                                                            *
*  This subroutine accepts the alternate record key for a    *
*  random read.                                              *
*                                                            *
*  RMS allows up to 255 alternate record keys. Each key      *
*  can have up to 255 characters.                            *
*                                                            *
**************************************************************

ACCEPT-ALTERNATE-KEY SECTION.

ACC-ALT-KEY.
	DISPLAY "Type employee number 9(6): "
			WITH NO ADVANCING.
	ACCEPT EMPLOYEE-NUMBER.

ACC-ALT-KEY-EXIT.
	EXIT.
**************************************************************
*                                                            *
*  This subroutine types the file status. The file status    *
*  is contained in "FILE-STATUS-1".                          *
*                                                            *
**************************************************************

TYPE-FILE-STATUS SECTION.

TYPE-FILE-STATUS-1.
	DISPLAY "File status = ",FILE-STATUS-1,": "
			WITH NO ADVANCING.

	IF FILE-STATUS-1 = 0
		DISPLAY "Sucessful completion"
		GO TO TYPE-FILE-STATUS-EXIT.

	IF FILE-STATUS-1 = 23
		DISPLAY "Invalid key, record not found"
		GO TO TYPE-FILE-STATUS-EXIT.

	IF FILE-STATUS-1 = 30
		DISPLAY "Permanent error"
		GO TO TYPE-FILE-STATUS-EXIT.

	IF FILE-STATUS-1 = 22
		DISPLAY "Duplicate key"
		GO TO TYPE-FILE-STATUS-EXIT.

	IF FILE-STATUS-1 = 10
		DISPLAY "AT END, no next logical record"
		GO TO TYPE-FILE-STATUS-EXIT.

	DISPLAY "%% Unexpected error %%".

TYPE-FILE-STATUS-EXIT.
	EXIT.
