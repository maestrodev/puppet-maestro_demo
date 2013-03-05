class maestro_demo::demo {
  class { 'maestro_demo::demo::dirs': } ->
  class { 'maestro_demo::demo::imports': }
}
