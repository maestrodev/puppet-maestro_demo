class maestro_demo::demo::composition::collabnet {
  # Add any specific deps here
  
  maestro::plugin { 'maestro-collabnet-plugin':
                        version => '1.2-20130312.234708-9' }

  maestro_demo::demo::composition::base { 'collabnet': }
}
