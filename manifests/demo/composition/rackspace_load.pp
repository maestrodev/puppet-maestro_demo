class maestro_demo::demo::composition::rackspace_load ( $enabled = true ) {
  # Add any specific deps here
  # This one has a file that needs to be placed

  $basedir = $maestro_demo::demo_home

  if $enabled {
    $loc = $basedir
  } else {
    $loc = "$basedir/disabled"
  }

  maestro_demo::demo::composition::base { 'rackspace-load':
                                            enabled => $enabled } ->

  file { "$loc/rackspace-load.rb":
    owner   => $maestro::params::user,
    group   => $maestro::params::group,
    mode    => '0644',
    require => File['/etc/maestro_lucee.json'],
    source  => "puppet:///modules/maestro_demo/demo/composition/rackspace-load.rb",
  }
}
