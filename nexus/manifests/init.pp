class nexus {
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
    cwd => '/home/vagrant',
    command => 'sudo wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz',
    path => ['/usr/bin', '/usr/sbin',],
  }

  exec { 'unzip-nexus':
    cwd => '/home/vagrant',
    path => ['/usr/bin', '/usr/sbin',],
    command => 'sudo tar -xvf nexus-3.0.2-02-unix.tar.gz,
  }

  exec { 'move-nexus':
    cwd => '/home/vagrant',
    path => ['/usr/bin', '/usr/sbin',],
    command => 'sudo mv nexus-3.0.2-02 nexus'
  }

  exec { 'adding-nexus-user':
    cwd => '/home/vagrant',
    path => ['/usr/bin', '/usr/sbin',],
    command => 'sudo adduser nexus',
  }

  exec { 'run-user':
    cwd => '/home/vagrant',
    path => ['/usr/bin', '/usr/sbin',],
    command => 'sudo run_as_user="nexus"',
  }

  exec { 'put-nexus-in-init.d':
    cwd => '/home/vagrant',
    path => ['/usr/bin', '/usr/sbin',],
    command => 'ln -s nexus/bin/nexus /etc/init.d/nexus'
  }

  exec { 'running-nexus':
    cwd => '/home/vagrant',
    path => ['/usr/bin', '/usr/sbin',],
    command => './nexus/bin/nexus run',
  }
}
