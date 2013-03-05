define maestro_demo::demo::source::base (
  $kind                 = 'source',
  $filename             = undef,
  $enabled              = true,
  $source_config        = {},
  $basename             = $maestro_demo::demo_home ) {

  # Filename should default to name if not specified
  if $filename == undef {
    $__filename = $name
  } else {
    $__filename = $filename
  }

  if $enabled == true {
    $_filename = "sources/${__filename}"
  } else {
    $_filename = "sources/disabled/${__filename}"
  }

  # Set up database fun based on json config files
  maestro_demo::demo::import { "${basename}/${_filename}.json":
                                template_name => "maestro_demo/demo/${kind}/${__filename}.json.erb",
                                kind => $kind,
                                config => $source_config }
}
