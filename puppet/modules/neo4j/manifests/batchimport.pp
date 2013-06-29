class neo4j::batchimport {
    exec {
      'download batch importer':
        command => '/usr/bin/wget http://dl.dropbox.com/u/7619809/batch-import-jar-with-dependencies.jar -O /tmp/batch-importer.jar',
        creates => '/tmp/batch-importer.jar';
    }    
    
    file {
      '/tmp/batch-importer.jar':
        mode    => '0755',
        require => Exec['download batch importer'];
    }
}