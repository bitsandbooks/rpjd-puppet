#  Bootstrap::ubuntu
class rpjdbootstrap::ubuntu inherits rpjdbootstrap {
    include apt

    $packages = [
        'apt-file',
        'apt-transport-https',
        'auditd', # part of SELinux
        'bikeshed', # provides `purge-old-kernels` for trusty
        'byobu', # provides `purge-old-kernels` for xenial
        'ca-certificates',
        'fail2ban',
        'git',
        'logrotate',
        'openssh-server',
        'openssh-blacklist',
        'selinux-basics',
        'selinux-policy-default',
        'software-properties-common', # Provides `add-apt-repository`
        'ubuntu-minimal',
        'whois',
    ]

    $services = [
        'fail2ban',
        'ntp',
        'ssh',
    ]

    package { $packages: ensure => latest, }

    service { $services:
        ensure => running,
        enable => true,
        hasrestart => true,
        hasstatus  => true,
    }

    cron { 'NIGHTLY - Sync apt cache and autoremove':
        command => '/usr/bin/apt-get update -qq; /usr/bin/apt-get autoremove -y;',
        user    => 'root',
        hour    => '0',
        minute  => '15',
    }

    # Sync local apt cache
    exec { 'apt-get update': command => '/usr/bin/apt-get update -qq', }

}
