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

Start-OSDCloud -OSLanguage de-de -OSBuild 21H2 -OSEdition Pro -OSLicense Retail -SkipODT -OSVersion 'Windows 10' -ZTI

$session = New-CimSession
$Model = (Get-CimInstance -CimSession $session -Class CIM_Computersystem).Model
    
    if ($Model -eq 'Surface Laptop 4') {
        ## download Surface Laptop 4 driver and copy to drivers directory
        $url = "osd.allaround-it.de/pub/driver/MSSL4/SurfaceLaptop4_Win10_19042_22.042.17186.0.msi"
        $dest = "c:\Drivers\SurfaceLaptop4_Win10_19042_22.042.17186.0.msi"
        Remove-Item -Path c:\Drivers\*.msi -Force -ErrorAction SilentlyContinue
        Write-Host 'Die Surface Laptop 4 Treiber werden kopiert. Bitte warten...'
        $ProgressPreference = 'SilentlyContinue'
        Invoke-WebRequest -uri $url -OutFile $dest
}

    if ($Model -eq 'Surface Laptop 3') {
    ## download Surface Laptop 3 driver and copy to drivers directory
        $url = "osd.allaround-it.de/pub/driver/MSSL3/SurfaceLaptop3_Win10_19041_22.011.9779.0.msi"
        $dest = "c:\Drivers\SurfaceLaptop3_Win10_19041_22.011.9779.0.msi"
        Remove-Item -Path c:\Drivers\*.msi -Force -ErrorAction SilentlyContinue
        Write-Host 'Die Surface Laptop 3 Treiber werden kopiert. Bitte warten...'
        $ProgressPreference = 'SilentlyContinue'
        Invoke-WebRequest -uri $url -OutFile $dest
}

if ($Model -eq 'Surface Laptop 5') {
        ## download Surface Laptop 5 driver and copy to drivers directory
        $url = "osd.allaround-it.de/pub/driver/MSSL5/SurfaceLaptop5_Win10_19044_22.102.17126.0.msi"
        $dest = "c:\Drivers\SurfaceLaptop5_Win10_19044_22.102.17126.0.msi"
        Remove-Item -Path c:\Drivers\*.msi -Force -ErrorAction SilentlyContinue
        Write-Host 'Die Surface Laptop 5 Treiber werden kopiert. Bitte warten...'
        $ProgressPreference = 'SilentlyContinue'
        Invoke-WebRequest -uri $url -OutFile $dest
}

if ($Model -eq 'Surface Pro 7') {
        ## download Surface Pro 7 driver and copy to drivers directory
        $url = "osd.allaround-it.de/pub/driver/MSSP7/SurfacePro7_Win10_19041_22.094.40075.0.msi"
        $dest = "c:\Drivers\SurfacePro7_Win10_19041_22.094.40075.0.msi"
        Remove-Item -Path c:\Drivers\*.msi -Force -ErrorAction SilentlyContinue
        Write-Host 'Die Surface Pro 7 Treiber werden kopiert. Bitte warten...'
        $ProgressPreference = 'SilentlyContinue'
        Invoke-WebRequest -uri $url -OutFile $dest
}

#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 10 seconds!"
Start-Sleep -Seconds 10
wpeutil reboot
