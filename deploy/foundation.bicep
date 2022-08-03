param host_name string
param cname_value string

module dns 'dns.bicep' = {
  name: 'dns-zones'
  params:{
    domain: 'licium.com'
  }
}

module dns_record 'dns-record.bicep' = {
  name: 'dns-record-${host_name}'
  params:{
    host_name: host_name
    cname_value: cname_value
  }
}
