define maestro_demo::demo::composition::base (
  $kind                 = 'composition',
  $filename             = undef,
  $enabled              = true,
  $basename             = $maestro_demo::demo_home ) {

  # Filename should default to name if not specified
  if $filename == undef {
    $__filename = $name
  } else {
    $__filename = $filename
  }

  if $enabled == true {
    $_filename = $__filename
  } else {
    $_filename = "disabled/${__filename}"
  }

  # Set up database fun based on json config files
  maestro_demo::demo::import { "${basename}/${_filename}.json":
                                template_name => "maestro_demo/demo/${kind}/${__filename}.json.erb",
                                kind => $kind }
}
