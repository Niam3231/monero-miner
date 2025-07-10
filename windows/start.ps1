$batchContent = 'echo WSL is installed. && echo It will now launch WSL and run auto.sh from my GitHub. && pause && wsl cd; curl -O https://raw.githubusercontent.com/Niam3231/monero-miner/refs/heads/main/linux/auto.sh; chmod +x ./auto.sh; ./auto.sh && start "" cmd /c "ping 127.0.0.1 -n 5 > nul & del "%~f0""'
$start = "wsl cd; curl -O https://raw.githubusercontent.com/Niam3231/monero-miner/refs/heads/main/linux/auto.sh; chmod +x ./auto.sh; ./auto.sh"
$response1 = Read-Host "Do you want to continue? (y/n)"

if ($response1 -eq 'y') {
	$response2 = Read-Host "Do you already have WSL installed? If you don't know what it is, please select no. (y/n)"
	if ($response2 -eq 'y') {
		cmd /c $start
		Write-Host "Press any key to exit the script..."
		Read-Host
		exit
	} else {
		Write-Host ""
		Write-Host "WSL will now be installed."
		Write-Host "Press any key to continue..."
		Read-Host
		Write-Host "Installing WSL..."
		wsl --install -d Debian -n
		Write-Host ""
		Write-Host ""
		Write-Host "If there was a error while installing WSL, please type error."
		Write-Host "Your computer needs to be restarted to use WSL."
		$response3 = Read-Host "Do you want to reboot your system now? (y/n/error)"
		if ($response3 -eq 'y') {
			Write-Host ""
			Set-Content -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\continue.bat" -Value $batchContent
			Write-Host "After the computer restarts, the script will continue."
			Read-Host
			Restart-Computer
			exit
		} elseif ($response3 -eq 'error') {
			Write-Host ""
			Write-Host "Press any key to exit the script..."
			Read-Host
			exit
		} else {
			Write-Host ""
			Write-Host "After you restart your computer, the script will continue."
			Set-Content -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\continue.bat" -Value $batchContent
			Write-Host "Press any key to exit the script..."
			Read-Host
			exit
		}
	}
} else {
	Write-Host "You chose no"
	Write-Host "Press any key to exit the script..."
	Read-Host
	exit
}