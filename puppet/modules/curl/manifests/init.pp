class curl($version = '7.22.0-3ubuntu4') {
	package { 'curl': ensure => version, }
}