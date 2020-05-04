#--------------------------------------------------------------------------------------------------------------
# Uninstall MS Teams 
#--------------------------------------------------------------------------------------------------------------
# Author : Cyrill Ettlin ILZ
# Version: 1.0 27.04.2020 Cyrill Ettlin Base script
#
#--------------------------------------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------------------------------------


# Removal Machine-Wide Installer - This needs to be done before removing the .exe below!

Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Teams Machine-wide Installer"} | Remove-WmiObject
        if (Test-Path "$($ENV:SystemDrive)\Users\*\AppData\Local\Microsoft\Teams") 
        {
             Start-Process -FilePath "$($ENV:SystemDrive)\Users\*\AppData\Local\Microsoft\Teams\Update.exe" -NoNewWindow -Wait -ArgumentList "--uninstall -s"
             #Wait a bit
             Start-Sleep -s 180 
        }


        Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Teams Machine-wide Installer"} | Remove-WmiObject

# Remove AppData folders
    Try {
        if (Test-Path "$($ENV:SystemDrive)\Users\*\AppData\Local\Microsoft\Teams") 
        {
            Remove-Item –Path "$($ENV:SystemDrive)\Users\*\AppData\Local\Microsoft\Teams" -Recurse -Force -ErrorAction Ignore
        }
        if (Test-Path "$($ENV:SystemDrive)\Users\*\AppData\Local\Microsoft\TeamsPresenceAddin")
        {
            Remove-Item –Path "$($ENV:SystemDrive)\Users\*\AppData\Local\Microsoft\TeamsPresenceAddin" -Recurse -Force -ErrorAction Ignore
        }
        if (Test-Path "$($ENV:SystemDrive)\Users\*\AppData\Local\Microsoft\TeamsMeetingAddin")
        {
            Remove-Item –Path "$($ENV:SystemDrive)\Users\*\AppData\Local\Microsoft\TeamsMeetingAddin" -Recurse -Force -ErrorAction Ignore
        }
        if (Test-Path "$($ENV:SystemDrive)\Users\*\AppData\Roaming\Microsoft Teams")
        {
            Remove-Item –Path "$($ENV:SystemDrive)\Users\*\AppData\Roaming\Microsoft Teams" -Recurse -Force -ErrorAction Ignore
        }
        if (Test-Path "$($ENV:SystemDrive)\Users\*\AppData\Roaming\Microsoft\Teams")
        {
            Remove-Item –Path "$($ENV:SystemDrive)\Users\*\AppData\Roaming\Microsoft\Teams" -Recurse -Force -ErrorAction Ignore
        }
        if (Test-Path "$($ENV:SystemDrive)\Users\*\AppData\Local\SquirrelTemp")
        {
            Remove-Item –Path "$($ENV:SystemDrive)\Users\*\AppData\Local\SquirrelTemp" -Recurse -Force -ErrorAction Ignore
        }
        if (Test-Path "HKCU:\Software\Microsoft\Office\Teams\PreventInstallationFromMsi")
        {
            Remove-Item -Path "HKCU:\Software\Microsoft\Office\Teams" -Force
        }
        if (Test-Path "HKCU:\Software\Microsoft\Installer\Products\AAB6F137689A4A549863C7A3AAAA67B0")
        {
            Remove-Item -Path "HKCU:\Software\Microsoft\Installer\Products\AAB6F137689A4A549863C7A3AAAA67B0" -Force -Recurse
        }


         if (Test-Path "$($ENV:SystemDrive)\Users\*\AppData\Desktop\Microsoft Teams.lnk")
        {
        #Just to get sure.
            Remove-Item –Path "$($ENV:SystemDrive)\Users\*\AppData\Desktop\Microsoft Teams.lnk" -Recurse -Force -ErrorAction Ignore
        }
    } Catch {
        Out-Null
        #Do nothing
    }
