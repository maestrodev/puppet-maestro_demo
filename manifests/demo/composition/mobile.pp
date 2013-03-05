class maestro_demo::demo::composition::mobile {
  # Add any specific deps here
  # Mobile requires androidsdk
  file { '/etc/facts.d':
    ensure => directory } -> 

  class { "maestro_nodes::androidsdk":
             user    => $maestro::params::agent_user,
             group   => $maestro::params::agent_group,
             home    => $maestro_demo::agent_home } ->

  maestro_demo::demo::composition::base { 'mobile': }
}
