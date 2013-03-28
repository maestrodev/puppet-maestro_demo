class maestro_demo::demo::composition::collabnet( $enabled = true ) {
  # Add any specific deps here
  
  maestro::plugin { 'collabnet-maestro-plugin':
                        version => '1.2' }

  maestro_demo::demo::composition::base { 'collabnet': enabled => $enabled }
}
