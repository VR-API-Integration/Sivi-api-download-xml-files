/*--------------------*/
/*--- Prerequisites --*/
/*--------------------*/
- Consumer Key and Consumer secret
- TenantId
- Powershell installed on your machine

/*------------------*/
/*--- BeforeStart --*/
/*------------------*/
1.- Create credentials file with using this script: .\CreateCredentialsFile.ps1
2.- Open script file "DownloadDataFromSIVIapi.ps1" and edit line 28 with the tenant ID value.
3.- In case your server has security check for scripts in place and will throw error that 
  scripts are not signed then please unblock all scripts with this command "Unblock-File NameOfScriptFile.ps1"

/*---------------------*/
/*--- HowToRunScript --*/
/*---------------------*/
A.- For an Incremental load, run the script with parameter (this will load all messages since the last execution):
	.\DownloadDataFromSIVIapi.ps1 incremental

B.- For an Full Load load, run the script with parameter (this will load all messages which api has):
	.\DownloadDataFromSIVIapi.ps1 fullload
