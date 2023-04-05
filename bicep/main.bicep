param location string = resourceGroup().location

param userIdentifier string = 'akr'

param virtualNetworkName string = 'vnet-${userIdentifier}-weu-002'
param virtualNetworkAddressSpace array = [
  '10.200.200.32/27'
]
param privateSubnetName string = 'snet-${userIdentifier}-weu-public-002'
param privateSubnetAddressSpace string = '10.200.200.0/27'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: virtualNetworkAddressSpace
    }
    subnets: [
      {
        name: privateSubnetName
        properties: {
          addressPrefix: privateSubnetAddressSpace
        }
      }
    ]
  }
}
