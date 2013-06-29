class haproxy {
	package { 'haproxy': }
	file { '/etc/haproxy/haproxy.cfg':
		require => Package['haproxy'],
		source => 'puppet:///modules/haproxy/haproxy.cfg',
		owner => 'root',
		group => 'root',
	}

	file { '/etc/default/haproxy':
		require => Package['haproxy'],
		source => 'puppet:///modules/haproxy/haproxy',
		owner => 'root',
		group => 'root',
	}
}