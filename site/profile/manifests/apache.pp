class profile::apache {
  include apache
  include apache::mod::ssl
  file { '/etc/ssl/certs/mycert.pem':
    ensure => present,
    source => "/etc/puppetlabs/puppet/ssl/certs/${::fqdn}.pem",
    mode   => '0600',
  }
  file { '/etc/ssl/certs/ca.pem':
    ensure => present,
    source => '/etc/puppetlabs/puppet/ssl/certs/ca.pem',
    mode   => '0600',
  }
  file { '/etc/ssl/certs/mycert.key':
    ensure => present,
    source => "/etc/puppetlabs/puppet/ssl/private_keys/${::fqdn}.pem",
    mode   => '0600',
  }
  file { '/var/www/reverse':
     ensure  => directory,
     require => Class['apache'],
  }
}
