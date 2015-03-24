class java($version) {

  package { 'openjdk-7-jre-headless':
    require => Exec['apt-get update'],
  }
}
