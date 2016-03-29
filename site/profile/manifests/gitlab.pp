class profile::gitlab { 
  class { '::gitlab':
    external_url => "http://${::fqdn}",
  }
}
