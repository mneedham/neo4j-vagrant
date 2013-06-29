class apt::recommended {
  file { 'apt_recommends':
    path   => '/etc/apt/apt.conf.d/80recommended',
    ensure => present,
    source => 'puppet:///modules/apt/80recommended',
    owner  => 'root',
    group  => 'root',
    mode   => '644',
  }
}

