$vpc = "vpcXXXXX"
$GroupName = "Test - Security Group"
$GroupDescription = "Test Security Group"

$ips = @(
"x.x.x.x/32",
"x.x.x.x/32",
"x.x.x.x/32"
)

$services = @(
"22",
"3306",
"3389"
)

$tags = @(
("Name","SecurityGroup_test"),
("Company","Company")
)

$groupid = New-EC2SecurityGroup -VpcId $vpc -GroupName $GroupName -GroupDescription $GroupDescription
$ipNo = $ips.count
$serviceNo = $services.count 
$tagNo = $tags.count

write-verbose "Total numver of ips: $ipNo"
write-verbose "Total numver of Services: $ipNo"

for($ip = 0; $ip -lt $ipNo; $ip++){
    for($service = 0; $service -lt $serviceNo; $service++){
        write-verbose "IP number $ip"
        $ipObj = new-object Amazon.EC2.Model.IpPermission 
        $ipObj.IpProtocol = "tcp" 
        $ipObj.FromPort =  ($services[$service])
        $ipObj.ToPort = ($services[$service])
        $ipObj.IpRanges.Add($IPS[$ip]) 
        Grant-EC2SecurityGroupIngress -GroupId $groupid -IpPermissions @($ipObj)
    }
}


foreach($tag in $tags){
    #write-host $tag[0] -ForegroundColor Yellow
    #write-host $tag[1] -ForegroundColor Green

    $tagName = New-Object Amazon.EC2.Model.Tag
    $tagName.Key = $tag[0]
    $tagName.Value = $tag[1]

    New-EC2tag -resource $groupid -Tag $tagName
}

#Remove-EC2SecurityGroup -GroupId $groupid