param location string = resourceGroup().location

param userIdentifier string = 'akr'

param virtualNetworkName string = 'vnet-${userIdentifier}-weu-002'
param virtualNetworkAddressSpace array = [
  '10.200.202.0/24'
]
param privateSubnetName string = 'snet-${userIdentifier}-weu-public-002'
param privateSubnetAddressSpace string = '10.200.200.0/27'

param publicSubnetName string = 'snet-${userIdentifier}-weu-public-002'
param publicSubnetAddressSpace string = '10.200.202.32/27'

param virtualNetworkNameServer array = [
  '8.8.8.8', '1.1.1.1'
]

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: virtualNetworkAddressSpace
    }
    dhcpOptions: {
      dnsServers: virtualNetworkNameServer
    }
    subnets: [
      {
        name: privateSubnetName
        properties: {
          addressPrefix: privateSubnetAddressSpace
        }
      }
      {
        name: publicSubnetName
        properties: {
          addressPrefix: publicSubnetAddressSpace
        }
      }
    ]
  }
}
