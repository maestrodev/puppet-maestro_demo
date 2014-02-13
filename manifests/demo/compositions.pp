class maestro_demo::demo::compositions ( $basename = $maestro_demo::demo_home ) {

  # Add any compositions here... ideally in the form
  # maestro_demo::demo::composition::<composition_name>

  # Generics - no special sauce required
  maestro_demo::demo::composition::generic { '_templates': enabled => false }
  maestro_demo::demo::composition::generic { 'alm': enabled => false }
  maestro_demo::demo::composition::generic { 'antwithivy': }
  maestro_demo::demo::composition::generic { 'centrepoint': }
  maestro_demo::demo::composition::generic { 'centrepoint-production': enabled => false }
  maestro_demo::demo::composition::generic { 'centrepoint-rackspace': enabled => false }
  maestro_demo::demo::composition::generic { 'cloud-instantservers': }
  maestro_demo::demo::composition::generic { 'cloud-rackspace': }
  maestro_demo::demo::composition::generic { 'cloud': }
  maestro_demo::demo::composition::generic { 'maestro': }
  maestro_demo::demo::composition::generic { 'wordpress': }
  maestro_demo::demo::composition::generic { 'mobile-ios': enabled => false }
  maestro_demo::demo::composition::generic { 'mobile-android': }

  # Non-generics - extra stuff makes these work
  class { 'maestro_demo::demo::composition::database': }
  class { 'maestro_demo::demo::composition::rackspace_load': enabled => false }
  class { 'maestro_demo::demo::composition::collabnet': enabled => false }
  class { 'maestro_demo::demo::composition::rightscale': }

  # Broken compositions (dependencies borked)
#  class { 'maestro_demo::demo::composition::puppet': }    # Puppet plugin causes hang
#  class { 'maestro_demo::demo::composition::redmine': }   # Rake (latest) installed by rvm is too new :(
}
