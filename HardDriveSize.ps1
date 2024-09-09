# Get information about all logical disks using WMI
$logicalDisks = Get-WmiObject win32_logicaldisk

# Define custom formatting for size and free space columns
$sizeFormat = "{0:N2} GB"
$freeSpaceFormat = "{0:N2} GB"

# Format the table header
Write-Host "Name  VolumeName  Size        FreeSpace"

# Loop through each logical disk and format its information
foreach ($disk in $logicalDisks) {
  # Calculate size and free space in GB
  $sizeGB = [math]::Round($disk.Size / 1GB, 2)
  $freeSpaceGB = [math]::Round($disk.FreeSpace / 1GB, 2)

  # Display formatted information for each disk
  Write-Host ("{0}  {1}  {2:$sizeFormat}  {3:$freeSpaceFormat}" -f $disk.Name, $disk.VolumeName, $sizeGB, $freeSpaceGB)
}
