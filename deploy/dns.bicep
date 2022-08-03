param domain string = 'licium.com'

resource dnszones_licium_com_name_resource 'Microsoft.Network/dnszones@2018-05-01' = {
  name: domain
  location: 'global'
  properties: {
    zoneType: 'Public'
  }
}

resource Microsoft_Network_dnszones_NS_dnszones_licium_com_name 'Microsoft.Network/dnszones/NS@2018-05-01' = {
  parent: dnszones_licium_com_name_resource
  name: '@'
  properties: {
    TTL: 172800
    NSRecords: [
      {
        nsdname: 'ns1-34.azure-dns.com.'
      }
      {
        nsdname: 'ns2-34.azure-dns.net.'
      }
      {
        nsdname: 'ns3-34.azure-dns.org.'
      }
      {
        nsdname: 'ns4-34.azure-dns.info.'
      }
    ]
    targetResource: {
    }
  }
}

resource Microsoft_Network_dnszones_SOA_dnszones_licium_com_name 'Microsoft.Network/dnszones/SOA@2018-05-01' = {
  parent: dnszones_licium_com_name_resource
  name: '@'
  properties: {
    TTL: 3600
    SOARecord: {
      email: 'azuredns-hostmaster.microsoft.com'
      expireTime: 2419200
      host: 'ns1-34.azure-dns.com.'
      minimumTTL: 300
      refreshTime: 3600
      retryTime: 300
      serialNumber: 1
    }
    targetResource: {
    }
  }
}
