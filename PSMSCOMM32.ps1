# Specify source and destination folders
$sourceFile = ".\MSCOMM32.OCX"
$destinationFolder = "C:\WINDOWS\SysWOW64"
$regFilePath = ".\MSCOMM32.reg"

# Check if the source file exists
if (Test-Path $sourceFile -PathType Leaf) {
    # Copy the file to the destination folder
    Copy-Item -Path $sourceFile -Destination $destinationFolder -Force
    Write-Host "MSCOMM32.OCX copied to $destinationFolder"

    # Register the file
    regsvr32.exe /s "$destinationFolder\MSCOMM32.OCX"
    Write-Host "MSCOMM32.OCX registered"

    # Check if the .reg file exists
    if (Test-Path $regFilePath -PathType Leaf) {
        # Import registry settings from the .reg file
        regedit.exe /s $regFilePath
        Write-Host "Registry settings imported from $regFilePath"
    } else {
        Write-Host "$regFilePath not found."
    }

    Write-Host "Installation completed."
} else {
    Write-Host "The file MSCOMM32.OCX does not exist in the source folder."
}