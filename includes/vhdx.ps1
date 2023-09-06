New-VHD -Path C:\Data\disk1.vhdx -SizeBytes 256GB -Dynamic | 
Mount-VHD -Passthru |
Initialize-Disk -PassThru |
New-Partition -DriveLetter X -UseMaximumSize | 
Format-Volume -Filesystem ntfs -FileSystemLabel data1 -Confirm:$False -Force
