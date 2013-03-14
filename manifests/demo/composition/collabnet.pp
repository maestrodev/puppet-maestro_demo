class maestro_demo::demo::composition::collabnet {
  # Add any specific deps here
  
  maestro::plugin { 'collabnet-maestro-plugin':
                        version => '1.2' }

  maestro_demo::demo::composition::base { 'collabnet': }
}
