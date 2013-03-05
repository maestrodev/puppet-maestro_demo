class maestro_demo::demo::imports {

  # Set up any source types we need
  class { 'maestro_demo::demo::source_types': } ->

  # Set up any sources we need
  class { 'maestro_demo::demo::sources': } ->

  # Set up any compositions we need (technically I suppose this should be projects)
  class { 'maestro_demo::demo::compositions': }
}
