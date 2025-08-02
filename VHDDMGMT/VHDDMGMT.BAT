@ ECHO OFF
TITLE VHDDMGMT
COLOR 0A

CLS
ECHO LOADING

IF EXIST COMMAND RMDIR /S /Q COMMAND
IF EXIST DRIVE RMDIR /S /Q DRIVE
IF EXIST STARTUP RMDIR /S /Q STARTUP
IF EXIST TEMP RMDIR /S /Q TEMP


IF NOT EXIST COMMAND MKDIR COMMAND
IF NOT EXIST DRIVE MKDIR DRIVE
IF NOT EXIST STARTUP MKDIR STARTUP
IF NOT EXIST TEMP MKDIR TEMP
IF NOT EXIST VHDD MKDIR VHDD

CD COMMAND
IF NOT EXIST 1 fsutil file createNew 1 0 > NUL
IF NOT EXIST 2 fsutil file createNew 2 0 > NUL
IF NOT EXIST 3 fsutil file createNew 3 0 > NUL
IF NOT EXIST 4 fsutil file createNew 4 0 > NUL
IF NOT EXIST 5 fsutil file createNew 5 0 > NUL
IF NOT EXIST 6 fsutil file createNew 6 0 > NUL
IF NOT EXIST 7 fsutil file createNew 7 0 > NUL

CD ..

CD DRIVE
IF NOT EXIST A: fsutil file createNew A 0 > NUL
IF NOT EXIST B: fsutil file createNew B 0 > NUL
IF NOT EXIST C: fsutil file createNew C 0 > NUL
IF NOT EXIST D: fsutil file createNew D 0 > NUL
IF NOT EXIST E: fsutil file createNew E 0 > NUL
IF NOT EXIST F: fsutil file createNew F 0 > NUL
IF NOT EXIST G: fsutil file createNew G 0 > NUL
IF NOT EXIST H: fsutil file createNew H 0 > NUL
IF NOT EXIST I: fsutil file createNew I 0 > NUL
IF NOT EXIST J: fsutil file createNew J 0 > NUL
IF NOT EXIST K: fsutil file createNew K 0 > NUL
IF NOT EXIST L: fsutil file createNew L 0 > NUL
IF NOT EXIST M: fsutil file createNew M 0 > NUL
IF NOT EXIST N: fsutil file createNew N 0 > NUL
IF NOT EXIST O: fsutil file createNew O 0 > NUL
IF NOT EXIST P: fsutil file createNew P 0 > NUL
IF NOT EXIST Q: fsutil file createNew Q 0 > NUL
IF NOT EXIST R: fsutil file createNew R 0 > NUL
IF NOT EXIST S: fsutil file createNew S 0 > NUL
IF NOT EXIST T: fsutil file createNew T 0 > NUL
IF NOT EXIST U: fsutil file createNew U 0 > NUL
IF NOT EXIST V: fsutil file createNew V 0 > NUL
IF NOT EXIST W: fsutil file createNew W 0 > NUL
IF NOT EXIST X: fsutil file createNew X 0 > NUL
IF NOT EXIST Y: fsutil file createNew Y 0 > NUL
IF NOT EXIST Z: fsutil file createNew Z 0 > NUL
CD ..

CD STARTUP
IF NOT EXIST YES fsutil file createNew YES 0 > NUL
IF NOT EXIST NO fsutil file createNew NO 0 > NUL
CD ..

: MENU

SET COMMAND=
SET FOLDER=
SET NETWORK=
SET DRIVE=
SET STARTUP=

CLS

ECHO VHDDMGMT
ECHO.
ECHO CHOOSE WHAT YOU WANT TO DO
ECHO.
ECHO CHOOSE [1] TO CREATE A NEW VIRTUAL HARD DISK DRIVE
ECHO CHOOSE [2] TO REMOVE A CREATED VIRTUAL HARD DISK DRIVE
ECHO CHOOSE [3] TO SEE A LIST OF VIRTUAL HARD DISK DRIVE
ECHO CHOOSE [4] TO REMOVE ALL VIRTUAL HARD DISK DRIVE
ECHO CHOOSE [5] TO OPEN STARTUP FOLDER
ECHO CHOOSE [6] ABOUT
ECHO CHOOSE [7] EXIT
ECHO.

CD COMMAND
SET /P COMMAND=CHOOSE COMMAND: 
ECHO.
CD ..

IF "%COMMAND%"=="" GOTO ERROR
IF "%COMMAND%"==" " GOTO ERROR

IF %COMMAND% EQU 1 GOTO CREATE
IF %COMMAND% EQU 2 GOTO REMOVE
IF %COMMAND% EQU 3 GOTO LIST
IF %COMMAND% EQU 4 GOTO CLEAN
IF %COMMAND% EQU 5 GOTO Startup
IF %COMMAND% EQU 6 GOTO ABOUT
IF %COMMAND% EQU 7 GOTO EXIT



IF NOT EXIST COMMAND\%COMMAND% GOTO ERROR

GOTO MENU




: CREATE

SET /P FOLDER=FOLDER		

IF EXIST DRIVE RMDIR /S /Q DRIVE
IF NOT EXIST DRIVE MKDIR DRIVE
CD DRIVE

IF NOT EXIST A: fsutil file createNew A 0 > NUL
IF NOT EXIST B: fsutil file createNew B 0 > NUL
IF NOT EXIST C: fsutil file createNew C 0 > NUL
IF NOT EXIST D: fsutil file createNew D 0 > NUL
IF NOT EXIST E: fsutil file createNew E 0 > NUL
IF NOT EXIST F: fsutil file createNew F 0 > NUL
IF NOT EXIST G: fsutil file createNew G 0 > NUL
IF NOT EXIST H: fsutil file createNew H 0 > NUL
IF NOT EXIST I: fsutil file createNew I 0 > NUL
IF NOT EXIST J: fsutil file createNew J 0 > NUL
IF NOT EXIST K: fsutil file createNew K 0 > NUL
IF NOT EXIST L: fsutil file createNew L 0 > NUL
IF NOT EXIST M: fsutil file createNew M 0 > NUL
IF NOT EXIST N: fsutil file createNew N 0 > NUL
IF NOT EXIST O: fsutil file createNew O 0 > NUL
IF NOT EXIST P: fsutil file createNew P 0 > NUL
IF NOT EXIST Q: fsutil file createNew Q 0 > NUL
IF NOT EXIST R: fsutil file createNew R 0 > NUL
IF NOT EXIST S: fsutil file createNew S 0 > NUL
IF NOT EXIST T: fsutil file createNew T 0 > NUL
IF NOT EXIST U: fsutil file createNew U 0 > NUL
IF NOT EXIST V: fsutil file createNew V 0 > NUL
IF NOT EXIST W: fsutil file createNew W 0 > NUL
IF NOT EXIST X: fsutil file createNew X 0 > NUL
IF NOT EXIST Y: fsutil file createNew Y 0 > NUL
IF NOT EXIST Z: fsutil file createNew Z 0 > NUL

SET /P DRIVE=DRIVE		
CD ..

CD STARTUP
SET /P STARTUP=STARTUP		
CD ..


ECHO.





IF "%FOLDER%"=="" GOTO ERROR
IF "%DRIVE%"=="" GOTO ERROR
IF "%STARTUP%"=="" GOTO ERROR

IF NOT EXIST "%FOLDER%" MKDIR "%FOLDER%"
IF NOT EXIST "%FOLDER%" GOTO ERROR
IF EXIST %DRIVE%: GOTO ERROR


IF "%FOLDER:~0,2%"=="\\" SET NETWORK=YES

IF "%NETWORK%"=="YES" (

	SUBST %DRIVE%: "%FOLDER%"

) ELSE (

	SUBST %DRIVE%: "%FOLDER%"

)


IF NOT EXIST %DRIVE%: GOTO ERROR

IF EXIST %DRIVE%: (

	fsutil file createNew VHDD\%DRIVE% 0 > NUL

	DEL DRIVE\%DRIVE%

)

IF %STARTUP% EQU YES (

	REM C:\Users\l.pumo\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
	REM %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup

	fsutil file createNew "TEMP\VHDDMGMT - %DRIVE%.BAT" 0 > NUL

	IF EXIST TEMP\VHDDMGMT - %DRIVE%.BAT (

		>> "TEMP\VHDDMGMT - %DRIVE%.BAT" ECHO @ECHO OFF
		>> "TEMP\VHDDMGMT - %DRIVE%.BAT" ECHO TITLE VHDDMGMT %DRIVE%
		>> "TEMP\VHDDMGMT - %DRIVE%.BAT" ECHO COLOR 0A
		>> "TEMP\VHDDMGMT - %DRIVE%.BAT" ECHO CLS
		>> "TEMP\VHDDMGMT - %DRIVE%.BAT" ECHO SET DRIVE=%DRIVE%
		>> "TEMP\VHDDMGMT - %DRIVE%.BAT" ECHO IF NOT EXIST %DRIVE%: ( SUBST %DRIVE%: "%FOLDER%" ^&^& GOTO EXIT ^) ELSE GOTO ERROR
		>> "TEMP\VHDDMGMT - %DRIVE%.BAT" ECHO : ERROR
		>> "TEMP\VHDDMGMT - %DRIVE%.BAT" ECHO ECHO ERROR
		>> "TEMP\VHDDMGMT - %DRIVE%.BAT" ECHO ECHO.
		>> "TEMP\VHDDMGMT - %DRIVE%.BAT" ECHO ECHO DRIVE %DRIVE% ALREADY EXIST
		>> "TEMP\VHDDMGMT - %DRIVE%.BAT" ECHO PAUSE ^> NUL
		>> "TEMP\VHDDMGMT - %DRIVE%.BAT" ECHO : EXIT
		>> "TEMP\VHDDMGMT - %DRIVE%.BAT" ECHO EXIT

		IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - %DRIVE%.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - %DRIVE%.BAT"

		MOVE /Y "TEMP\VHDDMGMT - %DRIVE%.BAT" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - %DRIVE%.BAT" > NUL

		IF NOT EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - %DRIVE%.BAT" ECHO UNABLE TO RUN THIS VHDD AT COMPUTER STARTUP

	)

)

START %DRIVE%:\

PAUSE > NUL

GOTO MENU



REM --------------------
REM REMOVE
REM --------------------

: REMOVE


CD VHDD
SET /P DRIVE=DRIVE		
CD ..

IF "%DRIVE%"=="" GOTO ERROR
IF "%DRIVE%"==" " GOTO ERROR
IF NOT EXIST %DRIVE%: GOTO ERROR


SUBST %DRIVE%: /D > NUL

IF EXIST %DRIVE%: (

	ECHO.
	ECHO UNABLE TO DELETE VIRTUAL HARD DISK DRIVE

)

IF NOT EXIST %DRIVE%: (

	DEL VHDD\%DRIVE%
	ECHO.
	ECHO VIRTUAL HARD DISK DRIVE SUCCESSFULLY REMOVED

	IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - %DRIVE%.BAT" (

		DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - %DRIVE%.BAT"
		ECHO.
		ECHO REMOVE VIRTUAL HARD DISK DRIVE %DRIVE%: FROM STARTUP

	)


)

IF EXIST DRIVE RMDIR /S /Q DRIVE
IF NOT EXIST DRIVE MKDIR DRIVE
CD DRIVE
IF NOT EXIST A: fsutil file createNew A 0 > NUL
IF NOT EXIST B: fsutil file createNew B 0 > NUL
IF NOT EXIST C: fsutil file createNew C 0 > NUL
IF NOT EXIST D: fsutil file createNew D 0 > NUL
IF NOT EXIST E: fsutil file createNew E 0 > NUL
IF NOT EXIST F: fsutil file createNew F 0 > NUL
IF NOT EXIST G: fsutil file createNew G 0 > NUL
IF NOT EXIST H: fsutil file createNew H 0 > NUL
IF NOT EXIST I: fsutil file createNew I 0 > NUL
IF NOT EXIST J: fsutil file createNew J 0 > NUL
IF NOT EXIST K: fsutil file createNew K 0 > NUL
IF NOT EXIST L: fsutil file createNew L 0 > NUL
IF NOT EXIST M: fsutil file createNew M 0 > NUL
IF NOT EXIST N: fsutil file createNew N 0 > NUL
IF NOT EXIST O: fsutil file createNew O 0 > NUL
IF NOT EXIST P: fsutil file createNew P 0 > NUL
IF NOT EXIST Q: fsutil file createNew Q 0 > NUL
IF NOT EXIST R: fsutil file createNew R 0 > NUL
IF NOT EXIST S: fsutil file createNew S 0 > NUL
IF NOT EXIST T: fsutil file createNew T 0 > NUL
IF NOT EXIST U: fsutil file createNew U 0 > NUL
IF NOT EXIST V: fsutil file createNew V 0 > NUL
IF NOT EXIST W: fsutil file createNew W 0 > NUL
IF NOT EXIST X: fsutil file createNew X 0 > NUL
IF NOT EXIST Y: fsutil file createNew Y 0 > NUL
IF NOT EXIST Z: fsutil file createNew Z 0 > NUL
CD ..

PAUSE > NUL


GOTO MENU






REM --------------------
REM LIST
REM --------------------

: LIST

SUBST | FIND "=>" > NUL

IF %ERRORLEVEL% EQU 0 (

SUBST

) ELSE (

	ECHO NO VIRTUAL HARD DISK DRIVE DETECTED
	IF EXIST VHDD RMDIR /S /Q VHDD
	IF NOT EXIST VHDD MKDIR VHDD

)


PAUSE > NUL
GOTO MENU

REM --------------------
REM CLEAN
REM --------------------

: CLEAN

IF EXIST A: SUBST A: /D > NUL
IF EXIST B: SUBST B: /D > NUL
IF EXIST C: SUBST C: /D > NUL
IF EXIST D: SUBST D: /D > NUL
IF EXIST E: SUBST E: /D > NUL
IF EXIST F: SUBST F: /D > NUL
IF EXIST G: SUBST G: /D > NUL
IF EXIST H: SUBST H: /D > NUL
IF EXIST I: SUBST I: /D > NUL
IF EXIST J: SUBST J: /D > NUL
IF EXIST K: SUBST K: /D > NUL
IF EXIST L: SUBST L: /D > NUL
IF EXIST M: SUBST M: /D > NUL
IF EXIST N: SUBST N: /D > NUL
IF EXIST O: SUBST O: /D > NUL
IF EXIST P: SUBST P: /D > NUL
IF EXIST Q: SUBST Q: /D > NUL
IF EXIST R: SUBST R: /D > NUL
IF EXIST S: SUBST S: /D > NUL
IF EXIST T: SUBST T: /D > NUL
IF EXIST U: SUBST U: /D > NUL
IF EXIST V: SUBST V: /D > NUL
IF EXIST W: SUBST W: /D > NUL
IF EXIST X: SUBST X: /D > NUL
IF EXIST Y: SUBST Y: /D > NUL
IF EXIST Z: SUBST Z: /D > NUL

FOR /R %%I IN (VHDD\*) DO SUBST %%~nxI: /D > NUL

IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - *.BAT" (

IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - A.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - A.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE A: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - B.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - B.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE B: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - C.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - C.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE C: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - D.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - D.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE D: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - E.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - E.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE E: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - F.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - F.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE F: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - G.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - G.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE G: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - H.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - H.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE H: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - I.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - I.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE I: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - J.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - J.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE J: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - K.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - K.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE K: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - L.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - L.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE L: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - M.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - M.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE M: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - N.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - N.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE N: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - O.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - O.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE O: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - P.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - P.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE P: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - Q.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - Q.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE Q: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - R.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - R.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE R: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - S.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - S.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE S: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - T.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - T.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE T: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - U.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - U.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE U: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - V.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - V.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE V: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - W.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - W.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE W: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - X.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - X.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE X: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - Y.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - Y.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE Y: FROM STARTUP
IF EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - Z.BAT" DEL "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\VHDDMGMT - Z.BAT" && ECHO REMOVE VIRTUAL HARD DISK DRIVE Z: FROM STARTUP

ECHO.

)

ECHO ANY PREVIOUSLY CREATED VIRTUAL HARD DISK DRIVES HAVE BEEN DELETED

PAUSE > NUL
GOTO MENU




REM --------------------
REM Startup
REM --------------------

: Startup

START "Startup" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\"

GOTO MENU


: ERROR

CLS

ECHO ERROR
ECHO.
IF "%COMMAND%"=="" ECHO COMMAND PARAMETER NOT SPECIFIED
IF "%COMMAND%"==" " ECHO COMMAND NOT REGISTERED

IF NOT EXIST COMMAND\%COMMAND% ECHO COMMAND NOT REGISTERED

IF "%COMMAND%"=="1" (

	IF "%FOLDER%"=="" ECHO FOLDER PARAMETER NOT SPECIFIED
	IF NOT "%FOLDER%"=="" ( IF NOT EXIST "%FOLDER%" ECHO FOLDER %FOLDER% NOT EXIST )

	IF "%DRIVE%"=="" ECHO DRIVE PARAMETER NOT SPECIFIED
	IF NOT "%DRIVE%"=="" ( IF EXIST %DRIVE%: ECHO DRIVE %DRIVE% ALREADY EXIST )

	IF "%STARTUP%"=="" ECHO STARTUP PARAMETER NOT SPECIFIED

)

IF "%COMMAND%"=="2" (

	IF "%DRIVE%"=="" ECHO DRIVE PARAMETER NOT SPECIFIED

	IF "%DRIVE%"==" " ECHO DRIVE PARAMETER NOT SPECIFIED

	IF NOT "%DRIVE%"=="" (

		IF NOT "%DRIVE%"==" " (

			IF NOT EXIST %DRIVE%: ECHO THE SPECIFIED DRIVE %DRIVE%: NOT EXIST

		)

	)

)

PAUSE > NUL

GOTO MENU

: ABOUT

ECHO TITLE		VHDDMGMT
ECHO VERSION		1.0
ECHO AUTHOR		Il Favoloso Mondo di Leo
ECHO WEB		https://ilfavolosomondodileo.wordpress.com/

PAUSE > NUL

GOTO MENU

: EXIT

IF EXIST COMMAND RMDIR /S /Q COMMAND
IF EXIST DRIVE RMDIR /S /Q DRIVE
IF EXIST STARTUP RMDIR /S /Q STARTUP
IF EXIST TEMP RMDIR /S /Q TEMP


EXIT