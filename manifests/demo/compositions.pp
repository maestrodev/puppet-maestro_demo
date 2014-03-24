class maestro_demo::demo::compositions ( $basename = $maestro_demo::demo_home ) {

  # Add any compositions here... ideally in the form
  # maestro_demo::demo::composition::<composition_name>

  # Generics - no special sauce required
  maestro_demo::demo::composition::generic { 'example_config_mgmt': }
  maestro_demo::demo::composition::generic { 'example_java_ant': }
  maestro_demo::demo::composition::generic { 'example_java_maven': }
  maestro_demo::demo::composition::generic { 'example_java_jenkins': }
  maestro_demo::demo::composition::generic { 'example_ruby_rake': }
  maestro_demo::demo::composition::generic { 'example_rubygem_rake': }
  maestro_demo::demo::composition::generic { 'example_shell': }
  maestro_demo::demo::composition::generic { 'maestro': }
  maestro_demo::demo::composition::generic { 'rightscale': }

  # Non-generics - extra stuff makes these work
  class { 'maestro_demo::demo::composition::database': }

  # Old compositions we no longer ship by default
#  maestro_demo::demo::composition::generic { '_templates': enabled => false }
#  maestro_demo::demo::composition::generic { 'alm': enabled => false }
#  maestro_demo::demo::composition::generic { 'antwithivy': }
#  maestro_demo::demo::composition::generic { 'centrepoint': }
#  maestro_demo::demo::composition::generic { 'centrepoint-production': enabled => false }
#  maestro_demo::demo::composition::generic { 'centrepoint-rackspace': enabled => false }
#  maestro_demo::demo::composition::generic { 'cloud-instantservers': }
#  maestro_demo::demo::composition::generic { 'cloud-rackspace': }
#  maestro_demo::demo::composition::generic { 'cloud': }
#  class { 'maestro_demo::demo::composition::rackspace_load': enabled => false }
#  class { 'maestro_demo::demo::composition::collabnet': enabled => false }
#  maestro_demo::demo::composition::generic { 'wordpress': }
#  maestro_demo::demo::composition::generic { 'mobile-ios': enabled => false }
#  maestro_demo::demo::composition::generic { 'mobile-android': }

  # Broken compositions (dependencies borked)
#  class { 'maestro_demo::demo::composition::puppet': }    # Puppet plugin causes hang
#  class { 'maestro_demo::demo::composition::redmine': }   # Rake (latest) installed by rvm is too new :(
}
