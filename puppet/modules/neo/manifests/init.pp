class neo {
  class { 'java': version => '7u25-0~webupd8~1', }
  class { 'neo4j': require     => Class['java'], }	
}