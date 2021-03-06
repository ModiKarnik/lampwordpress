class lampwordpress::wordpress inherits lampwordpress {

file { '/tmp/latest.tar.gz':
        ensure => present,
        source => "puppet:///modules/lampwordpress/latest.tar.gz",
    }


exec { 'extract':
        cwd => "/tmp",
	path => '/bin',
        command => "tar -xvzf latest.tar.gz",
        require => File['/tmp/latest.tar.gz'],
	creates => '/tmp/wordpress/wp-cron.php',
    }

file { '/var/www/html':
	ensure => present,
	recurse => true,
	source => '/tmp/wordpress/',
	require => Exec['extract'],
}

#exec { 'copy':
#        command => "cp -arp /tmp/wordpress/* /var/www/",
#        require => Exec['extract'],
#        owner   => 'apache2',
#        group   => 'apache2',
#	creates => '/var/www/wp-cron.php',	
#    }

file { '/var/www/html/wp-config.php':
        ensure => present,
	content => template("lampwordpress/wp-config.php.erb"),
    }
file { '/var/www/html/index.html':
	ensure => absent,
}
}

