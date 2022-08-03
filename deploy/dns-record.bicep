param domain_name string = 'licium.com'
param ttl int = 3600
param host_name string
param cname_value string

resource dnszones_licium_com_name_resource 'Microsoft.Network/dnszones@2018-05-01' existing = {
  name: domain_name
}
resource dnszones_licium_com_name_maxam_dev 'Microsoft.Network/dnszones/CNAME@2018-05-01' = {
  parent: dnszones_licium_com_name_resource
  name: host_name
  properties: {
    TTL: ttl
    CNAMERecord: {
      cname: cname_value
    }
    targetResource: {
    }
  }
}
