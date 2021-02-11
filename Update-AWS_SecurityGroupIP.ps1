$oldIP = "x.x.x.x/32"
$newIP = "y.y.y.y/32"
$secGroup = "sg-XXXXXXXXXX"
$port = 1433
$profileName = "Production" # Optional 

#revoke the old IP
$ipRev = @{ IpProtocol="tcp"; FromPort=$port; ToPort=$port; IpRanges= $oldIP }
Revoke-EC2SecurityGroupIngress -GroupId $secGroup -IpPermission $ipRev -ProfileName $profileName
#add the new IP
$ipAdd = @{ IpProtocol="tcp"; FromPort=$port; ToPort=$port; IpRanges=$newIP }
Grant-EC2SecurityGroupIngress -GroupId $secGroup -IpPermission $ipAdd -ProfileName $profileName