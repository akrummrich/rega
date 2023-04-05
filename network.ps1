$location = "West Europe"
$resourceGroupName = "rg-akr-network-weu-001"
$virtualNetworkName = "vnet-akr-weu-001"
$virtualNetworkAddressSpace = "10.200.200.0/24"
$privateSubnetName = "snet-akr-weu-private-001"
$privateSubnetAddressSpace = "10.200.200.0/27"

$rg = New-AzResourceGroup -Name $resourceGroupName -Location $location

$privateSubnetConfig = New-AzVirtualNetworkSubnetConfig -Name $privateSubnetName -AddressPrefix $privateSubnetAddressSpace

New-AzVirtualNetwork -Name $virtualNetworkName `
    -ResourceGroupName $rg.ResourceGroupName `
    -Location $rg.Location `
    -AddressPrefix $virtualNetworkAddressSpace `
    -Subnet $privateSubnetConfig
