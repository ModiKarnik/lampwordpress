class lampwordpress::install inherits lampwordpress {
$packagenames = [ 'apache2', 'mysql-server', 'mysql-client', 'php', 'libapache2-mod-php', 'php-mcrypt', 'php-mysql']

$packagenames.each |String $package| {
package {"${package}":
ensure => latest,
}
}
}
