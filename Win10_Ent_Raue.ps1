Write-Host -ForegroundColor Green "Starting OSDCloud ZTI"

Start-Sleep -Seconds 5

#Change Display Resolution for Virtual Machine

if ((Get-MyComputerModel) -match 'Virtual') {

Write-Host -ForegroundColor Green "Setting Display Resolution to 1600x"

Set-DisRes 1600

}

#Make sure I have the latest OSD Content

Write-Host -ForegroundColor Green "Updating OSD PowerShell Module"

Install-Module OSD -Force

Write-Host -ForegroundColor Green "Importing OSD PowerShell Module"

Import-Module OSD -Force

#Start OSDCloud

Write-Host -ForegroundColor Green "Start OSDCloud ZTI (Win10 Professional, Version 21H2, German)"

Start-OSDCloud -OSLanguage de-de -OSBuild 21H2 -OSEdition Pro -OSLicense Retail -SkipODT -OSVersion 'Windows 10' -ZTI -Screenshot

copy d:\*.msi c:\drivers
del C:\Drivers\SurfacePro8_Win11_22000_22.011.9739.0.msi -Force -ErrorAction SilentlyContinue

#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 10 seconds!"
Start-Sleep -Seconds 10
# wpeutil reboot
