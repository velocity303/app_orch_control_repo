define example::origin (
  String $message,
)
{
  file { '/var/tmp/message.txt':
    ensure  => present,
    content => "The origin message from this node, ${::fqdn}, is '${message}'",
  }
}
Example::Origin produces Message {
  origin  => $::fqdn,
  message => $message,
}
