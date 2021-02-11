$tpm = Get-Tpm

if($TPM.TpmPresent -eq $true -and $TPM.tpmready -eq $true){
    Write-host "TPM Found" -ForegroundColor Green
    
    $BLV = Get-BitLockerVolume -MountPoint "C:"
    if($BLV.KeyProtector){
            write-host "Key protector already enabled" -ForegroundColor Green
        }
        else{
             write-host "Adding Bitlocker Key Protectors" -ForegroundColor Green
             Add-BitLockerKeyProtector -MountPoint "c:" -RecoveryPasswordProtector 
            }

    $BLV = Get-BitLockerVolume -MountPoint "C:"
    $i = 0
    while($i -lt $BLV.KeyProtector.count){
        Write-host $i -ForegroundColor Yellow
        If($BLV.KeyProtector[$i].KeyProtectorType -eq "RecoveryPassword")
              {
              Write-host "Key protector Type: "$BLV.KeyProtector[$i].KeyProtectorType -ForegroundColor Green
              Backup-BitLockerKeyProtector -MountPoint "C:" -KeyProtectorId $BLV.KeyProtector[$i].KeyProtectorId
             }
        $i++
    }

    Enable-Bitlocker -MountPoint "c:" -TpmProtector

}