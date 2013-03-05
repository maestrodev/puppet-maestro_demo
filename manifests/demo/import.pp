define maestro_demo::demo::import( 
  $template_name,
  $kind,
  $config               = {},
  $use_sonar            = $maestro_demo::use_sonar,
  $use_archiva          = $maestro_demo::use_archiva,
  $use_irc              = false,
  $ec2_key_id           = $maestro_demo::ec2_key_id,
  $ec2_key              = $maestro_demo::ec2_key,
  $archiva_host         = $maestro_demo::archiva_host,
  $archiva_port         = $maestro_demo::archiva_port,
  $jenkins_host         = $maestro_demo::jenkins_host,
  $jenkins_port         = $maestro_demo::jenkins_port,
  $jenkins_context_path = $maestro_demo::jenkins_context_path,
  $sonar_host           = $maestro_demo::sonar_host,
  $sonar_port           = $maestro_demo::sonar_port,
  $sonar_context_path   = $maestro_demo::sonar_context_path,
  $working_copy_dir     = $maestro_demo::working_copy_dir,
  $demo_keypair         = $maestro_demo::demo_keypair) {
  
  if $use_sonar == undef {
    $sonar = defined(Service['sonar'])
  } else {
    $sonar = $use_sonar
  }
 
  if $use_archiva == undef {
    $archiva = defined(Service['archiva'])
  } else {
    $archiva = $use_archiva
  }

  if ($archiva) {
    $goal = 'deploy'
  } else {
    $goal = 'install'
  }

  # Note - sample files are currently populated into the place where the lucee does its pickup
  # once that no longer occurs we can throw them somewhere like temp if we want
  file { $name:
    owner   => $maestro::params::user,
    group   => $maestro::params::group,
    mode    => '0644',
    before  => Service['maestro'],
    require => File['/etc/maestro_lucee.json'],
    content => template($template_name),
  }

  # This is the magic utility that actually imports the data
  # for now, we put in the 'pickup' location for lucee, but this was put here
  # as we wanted to PUSH the data using API in the future
#  exec { "import-${kind}-${name}":
#    command => "maestro-import ${kind} ${name}",
#    path => "${maestro::maestro::homedir}/bin/",
#    require => File["${name}"] }
}
