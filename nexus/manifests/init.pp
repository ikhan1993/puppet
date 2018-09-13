class nexus {
  Exec { cwd => '/home/vagrant' }
  Exec { path => ['/usr/bin', '/usr/sbin', '/etc/init.d'] }

  package { 'java':
    ensure => installed,
  }

  package { 'wget':
    ensure => installed,
  }

  package { 'tar':
    ensure => installed,
  }

  exec { 'get-nexus':
    command => 'sudo wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz',
  }

  exec { 'unzip-nexus':
    command => 'sudo tar -xvf nexus-3.0.2-02-unix.tar.gz',
  }

  exec { 'move-nexus':
    command => 'sudo mv nexus-3.0.2-02 nexus'
  }

  user { 'adding-nexus-user':
    name => 'nexus',
    ensure => 'present',
  }

  exec { 'run nexus':
    cwd     => '/home/vagrant/nexus/bin/',
    command => 'bash nexus run',
  }

  #exec { 'run-user':
  #  command => 'sudo run_as_user="nexus"',
  #}

  #exec { 'put-nexus-in-init.d':
   # command => 'mv nexus/bin/nexus /etc/init.d/'
  #}

  #exec { 'run-nexus':
   # user => 'nexus',
   # cwd => '/etc/init.d',
   # command => 'bash nexus run',
  #}
}
