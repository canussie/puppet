# install nginx package, start it up
class { 'nginx': }
# create the www dir
file { [ '/var/www/', '/var/www/nginx']:
        ensure => directory,
}
# use wget module to download index.html from github
wget::fetch { 'download index.html from github':
        source => 'https://github.com/puppetlabs/exercise-webpage/blob/master/index.html',
        destination => '/var/www/nginx/index.html',
        timeout => 0,
        verbose => false,
}
# setup web server directory and change port to listen on 8000
nginx::resource::vhost { 'nginx vhost':
        www_root => '/var/www/nginx',
        listen_port => 8000,
}
