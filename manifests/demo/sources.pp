class maestro_demo::demo::sources {

  # Add any sources here... ideally in the form
  # maestro_demo:source::<source_name>
  
  maestro_demo::demo::source::generic { 'jenkins': }
  maestro_demo::demo::source::generic { 'rackspace': }
  maestro_demo::demo::source::generic { 'rightscale': }
  maestro_demo::demo::source::generic { 'aws': }
}
