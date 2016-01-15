define profile::apache::rproxy_vhost (
  $port,
  $host,
) {
  include profile::apache
  include apache::mod::proxy
  include apache::mod::rewrite
  Apache::Vhost {
    docroot         => '/var/www/reverse',
  }
  apache::vhost { "${::title}":
    ssl             => true,
    ssl_cert        => '/etc/ssl/certs/mycert.pem',
    ssl_chain       => '/etc/ssl/certs/ca.pem',
    ssl_key         => '/etc/ssl/certs/mycert.key',
    ssl_cipher      => 'EECDH+ECDSA+AESGCM:EECDH+aRSA+AESGCM:EECDH+ECDSA+SHA384:EECDH+ECDSA+SHA256:EECDH+aRSA+SHA384:EECDH+aRSA+SHA256:EECDH+aRSA+RC4:EECDH:EDH+aRSA:!RC4:!aNULL:!eNULL:!LOW:!3DES:!MD5:!EXP:!PSK:!SRP:!DSS',
    ssl_proxyengine => true,
    custom_fragment => 'SSLProxyVerify none',
    proxy_preserve_host => true,
    priority            => '11',
    port                => '443',
    proxy_pass          => [
      { 'path'          => '/', 'url' => "http://${host}:${port}/", 'reverse_urls' => "http://${host}:${port}", },
    ],
  }
  apache::vhost { "${::title}-redirect":
    priority => '10',
    port     => '80',
    rewrites => [
      {
        comment      => 'redirect http traffic to https',
        rewrite_cond => ['%{SERVER_PORT} !^443$'],
        rewrite_rule => ['^.*$ https://%{SERVER_NAME}%{REQUEST_URI} [L,R]'],
      },
    ],
  }
}
