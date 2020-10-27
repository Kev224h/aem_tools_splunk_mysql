foreach($line in Get-content .\servers.txt) {
	if ((test-path "\\$line\c$\install\") -eq $true){
        Write-Host "Copying splunkforwarder to server!" -ForegroundColor yellow
		
    }	
	Write-Host "Copying splunkforwarder to $line"
	robocopy c:\Install\splunkforwarder-7.3.5-86fd62efc3d7-x64-release \\$line\c$\Install\splunkforwarder-7.3.5-86fd62efc3d7-x64-release /e /z /MT:32
    Write-Host "Copy Complete" -ForegroundColor green
    #Write-Host "Installing splunkforwarder-735 to $line" -ForegroundColor yellow	
    #msiexec /i \\$line\c:\Install\splunkforwarder-7.3.5-86fd62efc3d7-x64-release\splunkforwarder-7.3.5-86fd62efc3d7-x64-release.msi DEPLOYMENT_SERVER="mon-us2p-dm-1a.adminsys.mrll.com:8089" AGREETOLICENSE=Yes /quiet

	
        
	if ((test-path "\\$line\c$\Install\splunkforwarder-7.3.5-86fd62efc3d7-x64-release") -eq $true){
		Write-Host "Installing splunkforwarder-735 to $line" -ForegroundColor yellow
		
	    Enable-PSRemoting
        #$newtab.Invoke("Enter-PSSession -computername $line")
        Enter-PSSession -computername $line

		#$newtab.DisplayName = "$line"
        #$secPasswd=ConvertTo-SecureString "P3anutBr1ttl3" -AsPlainText -Force
        #$cred=Get-Credential System.Management.Automation.PSCredential -ArgumentList "ADMINSYS\DSLCPDFDevSvc",$secPasswd
        set-location "\\$line\c$\install\splunkforwarder-7.3.5-86fd62efc3d7-x64-release"
        Invoke-Command -ComputerName $line -ScriptBlock {
        #Set-Location "c:\Install\splunkforwarder-7.3.5-86fd62efc3d7-x64-release"
msiexec /i c:\Install\splunkforwarder-7.3.5-86fd62efc3d7-x64-release\splunkforwarder-7.3.5-86fd62efc3d7-x64-release.msi DEPLOYMENT_SERVER="mon-us2p-dm-1a.adminsys.mrll.com:8089" AGREETOLICENSE=Yes /quiet
        }
        Exit-PSSession
        Write-Host "Install Complete" -ForegroundColor green
        }
    }