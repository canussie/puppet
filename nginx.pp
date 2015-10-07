class { 'nginx': }
wget::fetch { 'download index.html from github':
        source => 'https://github.com/puppetlabs/exercise-webpage/blob/master/index.html',
        destination => '/tmp/index.html',
        timeout => 0,
        verbose => false,
}
file { [ '/var/www/', '/var/www/nginx']:
        ensure => directory,
}
file { '/var/www/nginx/index.html':
        ensure => present,
        source => '/tmp/index.html',
}
nginx::resource::vhost { 'nginx vhost':
        www_root => '/var/www/nginx',
        listen_port => 8000,
}
