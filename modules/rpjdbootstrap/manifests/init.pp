# Bootstrap class. This class gets Puppet up and running.
class rpjdbootstrap {
    # Base package install list.
    $packages = [
        'ntp',
        'vim-common',
      ]

    # Silence Puppet and Vagrant annoyance about the puppet group.
    group { 'puppet': ensure => present, }

    # Allow members of the above 'puppet' group access to /etc/puppet.
    file { '/etc/puppet':
        ensure  => directory,
        group   => 'puppet',
        recurse => true,
    }

    # Install packages.
    package { $packages: ensure => latest, }

}
