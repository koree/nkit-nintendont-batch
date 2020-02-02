# nkit-nintendont-batch

The author of this script takes NO responsibility for anything that happens when running it. 
No software warranty is written or implied for this project.

**USE AT YOUR OWN RISK!!**

It is HIGHLY recommended that you make a copy of your 'games' folder before running this script. 
The script should be able to recover from common errors when converting to nkit.iso, but many cases have not been thoroughly tested. 

---INSTRUCTIONS---
1. Download the release of the Nkit program (this script written for v1.4) from gbatemp, here: 
	- IT IS RECOMMENDED YOU DO NOT USE YOUR EXISTING NKIT FOLDER WITH THIS SCRIPT, DUE TO LACK OF TESTING WITH EXISTING CONFIGURATIONS
2. Extract the NKit_v1.4.zip to a folder called 'nkit' on the root of your Nintendont drive
3. Place the ProcessNintendont.bat file from this repo in your 'games' folder and double click it to run

---EXAMPLE FOLDER STRUCTURE FOR REFERENCE---
Nkit:
	F:\nkit\ConvertToNKit.exe
Example Image to convert: 
	F:\games\GameToConvert\game.iso
Batch Script: 
	F:\games\ProcessNintendont.bat
	
---NOTES---
- If this script believes a successful conversion to nkit.iso occurs, it will REPLACE the .iso in your 'games' folder
	- This means your old 'game.iso' will be DELETED, so a backup of your 'games' folder is HIGHLY recommended
	- It is also therefore recommended you do a fresh download/unzip for your nkit folder, so old configurations or temp/processed folders do not impact how this script runs.
- The drive you run this script on will need at least 1.4GB free space in order to do the conversion. 
- Some games didn't convert properly when tested. For this reason, this script has some recovery code to keep the old images if nkit.iso conversion is unsuccessful.
	- This feature should not be used as a crutch, as noted in the intro. You should make a backup of your 'games' folder before running this program in case any errors arise. 
- Caught Errors will be posted to a file in the 'nkit' folder, called 'NkitBatErrors.txt', so you know what images didn't shrink.
- Personal testing of Nintendont compatibility with nkit.iso is limited so far, so once again, use at your own risk. 
- This script was tested on Windows 10 with standard tools like powershell, etc. This means most people should be able to use this without additional setup required on Win10. 
	- If your setup is different, you will likely hit errors. 