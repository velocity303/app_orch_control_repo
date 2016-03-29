forge "http://forge.puppetlabs.com"

# Modules from the Puppet Forge
# Note the versions are all set to :latest but after you've 
# installed you should change them to the exact version you want
mod "puppetlabs/inifile", :latest
mod "puppetlabs/stdlib", :latest
mod "puppetlabs/concat", :latest
mod "puppetlabs/ntp", :latest
mod "puppetlabs/firewall", :latest
mod "nanliu/staging", :latest
mod "lwf/remote_file", :latest
mod "hunner/wordpress", :latest
mod "puppetlabs/mysql", :latest
mod "puppetlabs/haproxy", :latest
mod "puppetlabs/aws", :latest

#An example of using a specific forge module version instead of latest
#Notice the addition of single quotes
#mod "puppetlabs/inifile", '1.3.0'

# Modules from Github using various references
# Further examples: https://github.com/puppetlabs/r10k/blob/master/doc/puppetfile.mkd#examples
# update the tag to the most current release when implementing
mod 'gms',
  :git    => 'https://github.com/npwalker/abrader-gms',
  :branch => 'gitlab_disable_ssl_verify_support'

mod 'hiera',
  :git => 'https://github.com/hunner/puppet-hiera',
  :tag => '1.3.1'

mod 'apache',
  :git => 'https://github.com/puppetlabs/puppetlabs-apache.git'

mod 'wordpress_app',
  :git => 'https://github.com/ipcrm/apporchestration-wordpress.git'
