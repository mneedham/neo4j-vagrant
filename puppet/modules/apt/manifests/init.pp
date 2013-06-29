class apt {
  file { 'apt_source_list':
    path   => '/etc/apt/sources.list.d',
    mode   => '755',
    owner  => 'root',
    group  => 'root',
    purge  => true,
    notify => Exec['apt_update'],
  }

  # This is included by the puppetlabs dpkg, which is installed during the bootstrap phase.
  # Prevents purging caused by the 'apt_source_list' resource.
  file { 'apt_puppetlabs_list':
    path   => '/etc/apt/sources.list.d/puppetlabs.list',
    mode   => '644',
    owner  => 'root',
    group  => 'root',
    notify => Exec['apt_update'],
  }

  exec { 'apt_update':
    path        => '/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    command     => 'apt-get update -q',
    refreshonly => true,    
  } 

  package { "python-software-properties": }
  
  exec { "add-apt-repository-oracle":
      command => "/usr/bin/add-apt-repository -y ppa:webupd8team/java",
      notify => Exec["apt_update"]
  }

  exec { "add-apt-repository-brightbox":
      command => "/usr/bin/add-apt-repository -y ppa:brightbox/ruby-ng",
      notify => Exec["apt_update"]
  }  
}
