#
# class maestro_demo
# Configures demo sources, types, projects, compositions, etc.
#
class maestro_demo (
  $user             = $maestro::params::user,
  $group            = $maestro::params::group,
  $agent_user       = $maestro::params::agent_user,
  $agent_group      = $maestro::params::agent_group,
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
  $demo_home        = "/usr/local/maestro/apps/lucee/WEB-INF/config/demo",
  $agent_home       = '/var/local/maestro-agent/',
  $working_copy_dir = '/var/local/maestro-agent/wc',
  $demo_keypair     = '/var/local/maestro-agent/.ssh/lucee-demo-keypair.pem' ) inherits maestro::params {

  include maestro_demo::demo

  if defined(Service['maestro-agent']) {
    include maestro_demo::agent
  }
}
