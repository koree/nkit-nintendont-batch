@echo off
set back=%cd%
set nkitDir=%back%\..\nkit
set outDir=%nkitDir%\Processed
set "errorCount=0"
rem set a[0] = hi

echo Attempting to adjust config to output .iso...
REM adjust config to output to nkit.iso
cd %nkitDir%
START /W powershell -Command "(gc NKit.dll.config) -replace '<add key=\"NkitFormat\" value=\"gcz\" />', '<add key=\"NkitFormat\" value=\"iso\" />'  | Out-File -encoding UTF8 nkit_temp.config"
START /W powershell -Command "(gc nkit_temp.config) -replace '<add key=\"WaitForKeyAfterProcessing\" value=\"true\"/>', '<add key=\"WaitForKeyAfterProcessing\" value=\"false\"/>'  | Out-File -encoding UTF8 nkit_temp2.config"

del nkit_temp.config

move NKit.dll.config NKit.dll.config_orig
move nkit_temp2.config NKit.dll.config

cd %back%

echo Config adjusted for script. Will be reverted when script finishes.

for /d %%i in (.\*) do (
cd "%%i"
echo %%i in progress...

if exist disc2.iso (
	START /W %nkitDir%\ConvertToNKit.exe disc2.iso
	move disc2.iso disc2.iso_temp
	if exist %outDir%\GameCube_MatchFail\*.nkit.iso (
		move %outDir%\GameCube_MatchFail\*.nkit.iso .\disc2.iso
		del disc2.iso_temp
	) else (
		echo Error found in %%i, ISO will be reverted after script finishes.
		set /a "errorCount+=1"
	)	
)

START /W %nkitDir%\ConvertToNKit.exe game.iso
move game.iso game.iso_temp
if exist %outDir%\GameCube_MatchFail\*.nkit.iso (
	move %outDir%\GameCube_MatchFail\*.nkit.iso .\game.iso
	del game.iso_temp
) else (
	echo Error found in %%i, ISO will be reverted after script finishes.
	set /a "errorCount+=1"
)

cd %back%
)

echo Found %errorCount% isos that did not complete successfully.
echo Hit enter to continue. Error ISOs will be reset to previous state.
pause >nul

for /d %%i in (.\*) do (
	cd "%%i"

	if exist disc2.iso_temp (
		echo. %DATE%:%TIME% /// %%i /// disc2.iso Error Found >> %nkitDir%\NkitBatErrors.txt
		move disc2.iso_temp disc2.iso
	)

	if exist game.iso_temp (
		echo. %DATE%:%TIME% /// %%i /// game.iso Error Found >> %nkitDir%\NkitBatErrors.txt
		move game.iso_temp game.iso
	)

	cd %back%
)

echo Any ISOs in error have been reset to their original state. You can see a log of the ISO errors in nkit\NkitBatErrors.txt. 
echo Hit enter to revert your nkit config and exit the script
pause >nul

REM adjust config back
cd %nkitDir%
del NKit.dll.config 
move NKit.dll.config_orig NKit.dll.config
pause