class maestro_demo::demo::composition::puppet {
  # Add any specific deps here
  maestro::plugin { 'maestro-puppet-plugin':
                        version => '1.0' }

  maestro_demo::demo::composition::base { 'puppet': }
}
