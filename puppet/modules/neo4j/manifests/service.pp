class neo4j::service {
	service { 'neo4j':
	   ensure  => running,
	   enable  => true,
	   hasstatus => false,
	   require => File['neo4j_init'],
	}
}