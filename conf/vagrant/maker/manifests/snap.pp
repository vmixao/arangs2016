# update the $PATH environment variable
Exec {
  path => [
		"/usr/local/sbin",
		"/usr/local/bin",
		"/usr/sbin",
		"/usr/bin",
		"/sbin",
		"/bin",
	]
}

# keep package information up to date
exec {
	"apt_update":
	command => "/usr/bin/apt-get update"
}



package {
    "wget":            ensure => installed, require => Exec ["apt_update"];
    "tar":             ensure => installed, require => Exec ["apt_update"];
    "gzip":            ensure => installed, require => Exec ["apt_update"];
	"build-essential": ensure => installed, require => Exec ["apt_update"];	
}



exec {

    'dl_SNAP':
        command   => 'wget -O snap-2013-11-29.tar.gz http://korflab.ucdavis.edu/Software/snap-2013-11-29.tar.gz',
        cwd       => '/usr/local/src',
        creates   => '/usr/local/src/snap-2013-11-29.tar.gz',
        require   => Package[ 'wget' ];
    'untar_SNAP':
        command   => 'tar -zxvf snap-2013-11-29.tar.gz',
        cwd       => '/usr/local/src',
        creates   => '/usr/local/src/snap',
        require   => [ Exec[ 'dl_SNAP' ], Package[ 'tar' ] ];
    'export_ZOE':
        command   => 'echo "export ZOE=/usr/local/src/snap/ZOE" >> .bashrc',
        cwd       => '/home/vagrant',
        require   => Exec[ 'untar_SNAP' ];
    'make_SNAP':
        command   => 'make',
        cwd       => '/usr/local/src/snap',
        creates   => '/usr/local/src/snap/snap',
        require   => [ Exec[ 'untar_SNAP' ], Package[ 'build-essential' ] ];
    'export_SNAP':
        command   => 'echo "export PATH=/usr/local/src/snap:$PATH" >> .bashrc',
        cwd       => '/home/vagrant',
        require   => Exec[ 'make_SNAP' ];


}
