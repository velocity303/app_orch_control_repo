define example::destination (
  $origin,
  $message,
) {
  file { '/var/tmp/message.txt':
    ensure  => present,
    content => "The message is '${message}' and its value is the same as ${origin}"
  }
}
Example::Destination consumes Message {
  origin  => $origin,
  message => $message,
}
