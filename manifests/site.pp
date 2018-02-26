#hiera_include('classes')
lookup('classes', {merge => unique}).include

resources {'firewall':
  purge => true,
}

Yumrepo <| |> -> Package <| provider != 'rpm' |>

node 'default-puppet-master.vagrantup.com' {
  file_line{'trapkeeper':
    path => '/etc/puppetlabs/puppetserver/services.d/ca.cfg',
    line => 'puppetlabs.trapperkeeper.services.watcher.filesystem-watch-service/filesystem-watch-service',
  }
}

node 'default' {}
