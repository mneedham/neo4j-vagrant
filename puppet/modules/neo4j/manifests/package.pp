class neo4j::package {
  $neo_path = '/usr/local/neo4j-enterprise-1.9'

  exec { 'download_neo_jar':
    command => 'curl http://dist.neo4j.org/neo4j-enterprise-1.9-unix.tar.gz | tar xz',
    cwd     => '/usr/local',
    path    => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
    creates => "${neo_path}/bin/neo4j",
  }

  file { 'neo4j_init':
    ensure => 'link',
    path   => '/etc/init.d/neo4j',
    target => "${neo_path}/bin/neo4j",
  }

  user { 'neo':
    ensure  => 'present',
    system  => true,
    require => Exec['download_neo_jar'],
  }

  file { 'neo_data':
    path    => "${neo_path}/data",
    mode    => '755',
    owner   => 'neo',
    require => User['neo'],
  }

  file { 'neo_log':
    path    => "${neo_path}/data/log",
    mode    => '755',
    owner   => 'neo',
    require => User['neo'],
  }

  file { 'neo4j-server-properties':
    ensure => 'file',
    path   => "${neo_path}/conf/neo4j-server-properties",
    source => "puppet:///modules/neo4j/conf/neo4j-server.properties",   
    require => Exec['download_neo_jar'],
  }  
}
