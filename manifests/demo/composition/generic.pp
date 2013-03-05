define maestro_demo::demo::composition::generic ( $enabled = true ) {
  # As its name suggests, this is a generic composition/project that has no additional dependencies,
  # so why bother with a class for it when a name will do?

  maestro_demo::demo::composition::base { $name: enabled => $enabled }
}
