# nginx.pp

# Detect OS family and install NGINX accordingly
case $facts['os']['family'] {
  'Debian': {
    package { 'nginx':
      ensure => installed,
    }

    service { 'nginx':
      ensure => running,
      enable => true,
    }

    file { '/var/www/html/index.nginx-debian.html':
      ensure  => file,
      content => '<center><h1>Hello Chef</h1><br> - This is NGINX installed using a Puppet Manifest<br>Executed by <b>Chef Courier</br></center>,
      require => Package['nginx'],
    }
  }

  'RedHat': {
    package { 'nginx':
      ensure => installed,
    }

    service { 'nginx':
      ensure => running,
      enable => true,
    }

    file { '/usr/share/nginx/html/index.html':
      ensure  => file,
      content => 'Hello Chef - This is Puppet Installed',
      require => Package['nginx'],
    }
  }

  default: {
    notify { 'Unsupported OS family for this manifest.':
      message => 'This manifest supports only Debian and RedHat families.',
    }
  }
}
