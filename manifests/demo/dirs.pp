class maestro_demo::demo::dirs ( $basename = $maestro_demo::demo_home ) {

  if !defined(File[$basename]) {
    file { $basename:
      ensure  => directory,
      owner   => $maestro::params::user,
      group   => $maestro::params::group,
      mode    => '0644',
      before  => Service['maestro'],
      require => File['/etc/maestro_lucee.json'],
    }
  }

  # until the directory is included in LuCEE
  if !defined(File["${basename}/disabled"]) {
    file { "${basename}/disabled":
      ensure  => directory,
      owner   => $maestro::params::user,
      group   => $maestro::params::group,
      mode    => '0644',
      before  => Service['maestro'],
      require => File[$basename, '/etc/maestro_lucee.json'],
    }
  }
  
  # make sure the demo/sources dir exists
  # it may have gone away if someone cleared out the demo dir
  if !defined(File["${basename}/sources"]) {
    file { "${basename}/sources":
      ensure  => directory,
      owner   => $maestro::params::user,
      group   => $maestro::params::group,
      mode    => '0644',
      before  => Service['maestro'],
      require => File[$basename, '/etc/maestro_lucee.json'],
    }
  }
  
  if !defined(File["${basename}/sources/disabled"]) {
    file { "${basename}/sources/disabled":
        ensure  => directory,
        owner   => $maestro::params::user,
        group   => $maestro::params::group,
        mode    => '0644',
        before  => Service['maestro'],
        require => File["${basename}/sources", '/etc/maestro_lucee.json'],
    }
  }
}
