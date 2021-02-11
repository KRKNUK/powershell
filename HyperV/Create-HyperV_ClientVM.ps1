# To-Do figure out a way of adding TPM to VM.

$vmName = "VM-Win10"

mkdir "c:\VMs\$vmName"

New-VM -Name $vmName `
-MemoryStartupBytes 4GB `
-BootDevice VHD `
-NewVHDPath "c:\VMs\$vmName\disk.vhdx" `
-Path "c:\VMs\$vmName" `
-NewVHDSizeBytes 40GB `
-Generation 2 `
-Switch "Default Switch"

Set-VM -Name $vmName -ProcessorCount 4
Enable-VMTPM -VMName $vmName

$DVD = Add-VMDvdDrive -VMName $vmName -Path "C:\ISO\SW_DVD9_Win_10_2004_64BIT_English_Home_Pro_SL_S_N_OEM_2_X22-29847.ISO" -Passthru
Set-VMFirmware $vmName -FirstBootDevice $DVD
