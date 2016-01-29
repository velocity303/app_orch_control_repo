application example (
  $message,
) {
  example::origin { $name:
    message => $message,
    export  => Message["message-${name}"],
  } 
  example::destination { $name:
    consume => Message["message-${name}"],
  }
}
