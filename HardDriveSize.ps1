Get-WmiObject win32_logicaldisk | Format-Table Name, VolumeName, @{n="Size";e={[math]::Round($_.Size/1GB,2)}},@{n="FreeSpace";e={[math]::Round($_.FreeSpace/1GB,2)}}
