	Param(
		[Parameter()]
		[string] $Run = 'incremental'
	)

Write-host "`n"

if ($Run -ne "incremental" -and $Run -ne "fullload")
{
	Write-Host 'You used wrong RUN parameter.'
    Write-Host 'Only "incremental" or "fullload" are supported.'
	exit
}

. ./GetDataAndCreateZipFile.ps1
. ./ManageRunSettingsAndToken.ps1

$ErrorActionPreference = "Stop"

if(-not(Test-Path -Path ./Credentials/Credentials.xml -PathType Leaf))
{
    Write-host 'File Credentials.xml does not exist. Please run CreateCredentialsFile.ps1 to create it.' -ForegroundColor red
    Write-host 'This script will not run without this file.' -ForegroundColor red
    exit
}

# API Configuration
$TenantId = "sandbox"

Get-SIVIMessageZip -TypeExecution $Run -TenantId $TenantId

Write-host "`n"
