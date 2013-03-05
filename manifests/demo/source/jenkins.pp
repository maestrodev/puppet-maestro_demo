class maestro_demo::demo::source::jenkins(
  $jenkins_host         = $maestro::demo::jenkins_host,
  $jenkins_port         = $maestro::demo::jenkins_port,
  $jenkins_context_path = $maestro::demo::jenkins_context_path) {

  $source_config = { 'jenkins_host' => $jenkins_host,
                     'jenkins_port' => $jenkins_port,
                     'jenkins_web_path' => $jenkins_context_path }
 
  maestro_demo::demo::source::base { 'jenkins':
    source_config => $source_config,
  }
}
