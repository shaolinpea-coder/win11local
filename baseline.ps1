# Universal baseline (Pro + Home)

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" `
 /v NoConnectedUser /t REG_DWORD /d 3 /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" `
 /v DisableConsumerFeatures /t REG_DWORD /d 1 /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" `
 /v KFMSilentOptIn /t REG_SZ /d "" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" `
 /v ScoobeSystemSettingEnabled /t REG_DWORD /d 0 /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" /v KFMBlockOptIn /t REG_DWORD /d 1 /f

Enable-ComputerRestore -Drive "C:\"
Checkpoint-Computer -Description "Baseline IT"

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" `
 /v VisualFXSetting /t REG_DWORD /d 2 /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
 /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" `
 /v Enabled /t REG_DWORD /d 0 /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" `
 /v HideFirstRunExperience /t REG_DWORD /d 1 /f


reg add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" `
 /v AllowNewsAndInterests /t REG_DWORD /d 0 /f

# Disable Copilot (Win11)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" `
 /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" `
 /v DisablePrivacyExperience /t REG_DWORD /d 1 /f

# Apply to default profile (future users)
reg load HKU\DefaultUser C:\Users\Default\NTUSER.DAT

reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" `
 /v VisualFXSetting /t REG_DWORD /d 2 /f

reg add "HKU\DefaultUser\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
 /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f

reg unload HKU\DefaultUser

