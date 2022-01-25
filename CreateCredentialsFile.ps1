if(-not(Test-Path -Path ./Credentials/Credentials.xml -PathType Leaf))
{
	if(-not(Test-Path -Path ./Credentials))
	{
		New-Item -Path . -Name "Credentials" -ItemType Directory -Force
	}

	if(-not(Test-Path -Path ./SIVIMessages))
	{
		New-Item -Path . -Name "SIVIMessages" -ItemType Directory -Force
	}	
	
	clear
	Write-host "`n"	
	Write-host 'Via this wizard you will create encrypted file which will safely store credentials needed for connection to siviapi of Visma Reat.' -ForegroundColor Green
	Write-host 'Read carefully all messages and try to aviod mistakes during entering inputs.' -ForegroundColor Green
	Write-host "`n"

    $clientId = Read-Host -Prompt 'Please write your Consumer Key'
    $clientSecret = Read-Host -Prompt 'Please write your Consumer secret'
    $securedClientSecret = $clientSecret | ConvertTo-SecureString -AsPlainText -Force
        
    $Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $clientId, $securedClientSecret | Export-CliXml  -Path ./Credentials/Credentials.xml

	Write-host "`n"
    if(-not(Test-Path -Path ./Credentials/Credentials.xml -PathType Leaf))
    {
        Write-host 'Error file with credentials was not created.' -ForegroundColor red
    } else {
        Write-host 'Credentials successfully saved in file for future use.' -ForegroundColor Green
    }

} else {
	Write-host "`n"
    Write-host 'Error: file with credentials already exists.' -ForegroundColor red
    Write-host 'Please, remove file: Credentials.xml or rename it and start script again.' -ForegroundColor red
}

Write-host "`n"