class maestro_demo::agent {
  # Add any specific deps here
  # Mobile requires androidsdk
  if ! defined(File['/etc/facter']) {
    file { '/etc/facter': ensure => directory }
  }
  if ! defined(File['/etc/facter/facts.d']) {
    file { '/etc/facter/facts.d': ensure => directory }
  }

  class { "maestro_demo::androidsdk":
    user    => $maestro_demo::agent_user,
    group   => $maestro_demo::agent_group,
    home    => $maestro_demo::agent_home
  }

}
