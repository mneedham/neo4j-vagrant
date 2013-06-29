class neo4j {
  package { 'lsof':
	  ensure => '4.81.dfsg.1-1build1',
  }
	
  class { 'neo4j::package':
	  require => [Package['lsof'], Package['curl']]
  } 

  class { 'neo4j::service':
    require => Class['neo4j::package']
  }
}
