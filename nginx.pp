class { 'nginx': }
file { [ '/var/www/', '/var/www/nginx']:
        ensure => directory,
}
wget::fetch { 'download index.html from github':
        source => 'https://github.com/puppetlabs/exercise-webpage/blob/master/index.html',
        destination => '/var/www/nginx/index.html',
        timeout => 0,
        verbose => false,
}
nginx::resource::vhost { 'nginx vhost':
        www_root => '/var/www/nginx',
        listen_port => 8000,
}
