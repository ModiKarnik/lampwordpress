class lampwordpress::db inherits lampwordpress {

exec {'mysqladmin':
	path => '/usr/bin/',
	command => "mysqladmin -u root password 123@India && touch /tmp/test1",
	creates => '/tmp/test1',

}

file { '/tmp/mysqlcommands':
	ensure => present,
	source => "puppet:///modules/lampwordpress/mysqlcommands",
	require => Exec['mysqladmin'],

}
exec {'mysqlroot':
	path => '/usr/bin/',
	command => "mysql -uroot -p123@India < /tmp/mysqlcommands && touch /tmp/test2",
	creates => '/tmp/test2',
	require => File['/tmp/mysqlcommands'],	 
}

} 
