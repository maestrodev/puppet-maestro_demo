class maestro_demo::demo::composition::mobile_android {
  # Add any specific deps here
  # Mobile requires androidsdk
  if ! defined(File['/etc/facts.d']) {
    file { '/etc/facts.d': ensure => directory }
  }

  class { "maestro_nodes::androidsdk":
             user    => $maestro_demo::agent_user,
             group   => $maestro_demo::agent_group,
             home    => $maestro_demo::agent_home } ->

  maestro_demo::demo::composition::base { 'mobile-android': }
}
