$RG = "ResourceGroup001"
$zone = "example.com"

$target = "A_Record.example.com"

$records = @(
    "test",
    "test01"
)

foreach ($record in $records){
    Remove-AzDnsRecordSet -Name $record -RecordType A -ZoneName $zone -ResourceGroupName $RG 
    New-AzDnsRecordSet -Name $record -RecordType CNAME -ZoneName $zone -ResourceGroupName $RG -Ttl 3600 -DnsRecords (New-AzDnsRecordConfig -Cname $target)
}