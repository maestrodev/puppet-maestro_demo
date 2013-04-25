class maestro_demo::demo::composition::rightscale( $enabled = false ) {
  # Add any specific deps here

  maestro_demo::demo::composition::base { 'rightscale': enabled => $enabled }
}
