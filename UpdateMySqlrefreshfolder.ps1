foreach($line in Get-content .\servers.txt) {
	if ((test-path "\\$line\f$\mysql_refresh_data") -eq $true){
        Write-Host "Existing mysql_new folder detected, deleting it!" -ForegroundColor yellow
		Remove-Item -path "\\$line\f$\mysql_refresh_data" -recurse -force
    }	
	Write-Host "Copying mysql_refresh_data folder to $line"
	robocopy f:\mysql_refresh_data \\$line\f$\mysql_refresh_data /e /z /MT:32
}
Write-Host "Copy Complete" -ForegroundColor green