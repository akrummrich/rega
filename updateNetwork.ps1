$location = "West Europe"
$resourceGroupName = "rg-akr-network-weu-001"
$virtualNetworkName = "vnet-akr-weu-001"
$virtualNetworkNameServer = @("8.8.8.8", "1.1.1.1")
$publicSubnetName = "snet-akr-weu-public-001"
$publicSubnetAddressSpace = "10.200.200.32/27"


$rg = Get-AzResourceGroup -Name $resourceGroupName -Location $location
$vnet = Get-AzVirtualNetwork -Name $virtualNetworkName -ResourceGroupName $rg.ResourceGroupName
Add-AzVirtualNetworkSubnetConfig -Name $publicSubnetName -VirtualNetwork $vnet -AddressPrefix $publicSubnetAddressSpace
$vnet | Set-AzVirtualNetwork

$dnsObject = New-Object -type PSObject -Property @{"DnsServers" = $virtualNetworkNameServer}
$vnet.DhcpOptions = $dnsObject
$vnet | Set-AzVirtualNetwork