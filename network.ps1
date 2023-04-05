$userIdentifier = "akr"

$location = "West Europe"
$resourceGroupName = "rg-$userIdentifier-network-weu-001"
$virtualNetworkName = "vnet-$userIdentifier-weu-001"
$virtualNetworkAddressSpace = "10.200.200.0/24"
$privateSubnetName = "snet-$userIdentifier-weu-private-001"
$privateSubnetAddressSpace = "10.200.200.0/27"

$rg = New-AzResourceGroup -Name $resourceGroupName -Location $location

$privateSubnetConfig = New-AzVirtualNetworkSubnetConfig -Name $privateSubnetName -AddressPrefix $privateSubnetAddressSpace

New-AzVirtualNetwork -Name $virtualNetworkName `
    -ResourceGroupName $rg.ResourceGroupName `
    -Location $rg.Location `
    -AddressPrefix $virtualNetworkAddressSpace `
    -Subnet $privateSubnetConfig
