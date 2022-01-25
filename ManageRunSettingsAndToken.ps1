Function Get-SIVIRunSetting {

	[CmdletBinding()]
	Param(
	)
		
	$LocalStoragePath = Get-RunSettingStoragePath
	$RunSettingsFile = Join-Path $LocalStoragePath 'RunSettings';

	If (Test-Path $RunSettingsFile) 
	{
		$RunSetting = Import-CliXml -Path $RunSettingsFile
	}
	else {
		$FetchedUntil = (Get-Date).ToUniversalTime().Date
		$RunSetting = [psCustomObject]@{ FetchedUntil =  $FetchedUntil}
	}

	return $RunSetting
}

Function Edit-SIVIRunSetting {

	[CmdletBinding()]
	Param(
		[Parameter(Mandatory)]
		[psCustomObject]$RunSetting
	)
	
	$LocalStoragePath = Get-RunSettingStoragePath
	$RunSettingsFile = Join-Path $LocalStoragePath 'RunSettings';
	$RunSetting | Export-CliXml -Path $RunSettingsFile
}

Function Get-RunSettingStoragePath {
	$CurrentFolder = Get-Location

	$LocalStoragePath = Join-Path $CurrentFolder 'Credentials'

	If(!(Test-Path $LocalStoragePath))
	{
		New-Item -ItemType Directory -Force -Path $LocalStoragePath
	}
	
	return $LocalStoragePath;
}

Function Get-AuthenticationToken {
	[CmdletBinding()]
    param(
	[Parameter(Mandatory)]
	[string]$ClientId,
	[Parameter(Mandatory)]
	[string]$ClientSecret,
	[Parameter(Mandatory)]
	[string]$IdentityAddress
	) 
		
	Write-Host 'Retrieving token for Client Id: ' -ForegroundColor Green -NoNewline
	Write-Host $ClientId -ForegroundColor White

	$Headers = @{
		'Cache-Control'='no-cache'
		'Content-Type'='application/x-www-form-urlencoded'
	}
	
	$Body = @{
		grant_type='client_credentials'
		client_id=$clientId
		client_secret=$clientSecret
	}
	
	$Response = Invoke-WebRequest -Method POST -Uri $IdentityAddress -Headers $Headers -Body $Body -UseBasicParsing

	$Content = $Response.Content | ConvertFrom-Json
	$Token = $Content.token_type + ' ' + $Content.access_token
	
	return $Token
}



