<powershell>
Set-ExecutionPolicy RemoteSigned
Import-Module AWSPowerShell
New-Item -Path "C:\temp" -ItemType "directory" -Force
invoke-webrequest -URI "https://aws-codedeploy-eu-west-1.s3.amazonaws.com/latest/codedeploy-agent.msi" -outfile c:\temp\codedeploy-agent.msi
Start-Process msiexec.exe -Wait -ArgumentList '/I c:\temp\codedeploy-agent.msi /quiet /l c:\temp\host-agent-install-log.txt'

import-module servermanager
install-windowsfeature Web-Server, Web-Asp-Net45, Web-Mgmt-Service -IncludeManagementTools

invoke-webrequest -URI "https://download.microsoft.com/download/0/1/D/01DC28EA-638C-4A22-A57B-4CEF97755C6C/WebDeploy_amd64_en-US.msi" -outfile "C:\temp\WebDeploy_amd64_en-US.msi"
msiexec /L msdeployinstall.log /I "C:\temp\WebDeploy_amd64_en-US.msi"

</powershell>