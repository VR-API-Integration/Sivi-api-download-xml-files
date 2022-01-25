# Powershell.Download.API
PowerShell Scripts to download SIVI API response into XML files

### Prerequisites
This is what you need in order to execute these scripts:
- Powershell installed on your machine
- Consumer Key and Consumer Secret
- Tenant Id

### BeforeStart
Before getting the information from the API, you need to follow these steps to store the credentials in your machine:
1. Create credentials file with using this script: *.\CreateCredentialsFile.ps1*
2. Open script file *DownloadDataFromSIVIapi.ps1* and edit line 28 with the tenant ID value.
3. In case your server has security check for scripts in place and will throw error that scripts are not signed then please unblock all scripts with this command *Unblock-File NameOfScriptFile.ps1*
Remember, the script uses credentials so you should be careful with where you store these files and with whom you share this information.

### HowToRunScript
You can run the script in two ways, depending on the parameters you are passing to it:
- For an Incremental load, run the script with parameter (this will load all messages since the last execution): *.\DownloadDataFromSIVIapi.ps1 incremental*
- For an Full Load load, run the script with parameter (this will load all messages which api has): *.\DownloadDataFromSIVIapi.ps1 fullload*
