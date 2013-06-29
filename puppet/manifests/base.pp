class all_the_things {
	exec { 'apt-get update': command => '/usr/bin/apt-get update'; }
	package { 'curl': ensure => '7.22.0-3ubuntu4', }
	class { 'apt': }
}

node default {
  class { 'all_the_things': }
  class { $role:
  	require => Class['all_the_things']
  }
} 