node default {
  exec { 'apt-get update': command => '/usr/bin/apt-get update'; }	
  package { 'curl': ensure => '7.22.0-3ubuntu4', }
  class { 'apt': }
  class { "haproxy": }
  class { 'java': version => '7u25-0~webupd8~1', }
  class { 'neo4j': require     => Class['java'], }
}
 