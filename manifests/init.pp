#
# class maestro::demo
# Configures demo sources, types, projects, compositions, etc.
#
# Requires maestro::maestro to have been loaded
class maestro_demo (
  $use_sonar        = undef,
  $use_archiva      = undef,
  $ec2_key_id       = '',
  $ec2_key          = '',
  $archiva_host     = 'localhost',
  $archiva_port     = '8082',
  $jenkins_host     = 'localhost',
  $jenkins_port     = '8181',
  $jenkins_context_path = '/',
  $sonar_host       = 'localhost',
  $sonar_port       = '9000',
  $sonar_context_path = '/',
  $maestro_home     = $maestro::maestro::homedir,
  $demo_home        = "${maestro::maestro::homedir}/apps/lucee/WEB-INF/config/demo",
  $agent_home       = '/var/local/maestro-agent/',
  $working_copy_dir = '/var/local/maestro-agent/wc',
  $demo_keypair     = '/var/local/maestro-agent/.ssh/lucee-demo-keypair.pem' ) {

  class { 'maestro_demo::demo': }
}
