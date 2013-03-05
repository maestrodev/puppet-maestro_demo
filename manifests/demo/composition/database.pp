class maestro_demo::demo::composition::database {
  # Add any specific deps here

  postgresql::db { 'maestro_test':
    user     => 'maestro_test',
    password => 'maestro_test',
    require => Class['postgresql::server'],
  }

  maestro_demo::demo::composition::base { 'database': }
}
