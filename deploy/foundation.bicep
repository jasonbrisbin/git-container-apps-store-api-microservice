param dnsEntries object = {
  record: [
    {
      hostname: 'www'
      cname: 'maxam.prod'
    }
  ]
}

module dns 'dns.bicep' = {
  name: 'dns-zones'
  params:{
    domain: 'licium.com'
  }
}

module dns_record 'dns-record.bicep' = [for record in dnsEntries.record:{
  name: 'dns-record-${record.hostname}'
  params:{
    host_name: record.hostname
    cname_value: record.cname
  }
}]
