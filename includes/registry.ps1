# Remove 3D Objects from This PC
Remove-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}'

# Add seconds to clock
New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name ShowSecondsInSystemClock -Value 1

# Remove Windows Search bar
New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Value 0
New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name CortanaConsent -Value 0

# Remove User UAC for local users
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Value 0