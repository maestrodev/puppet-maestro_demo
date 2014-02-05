class maestro_demo::androidsdk(
  $user,
  $group,
  $home,
  $proxy_host = undef,
  $proxy_port = undef){
  
  #Android SDK
  class { 'android':
    version    => '22.3',
    user       => $user,
    group      => $group,
    proxy_host => $proxy_host,
    proxy_port => $proxy_port,
  }

  # Android SDK Build-tools, revision 19.0.1
  android::build_tools { 'build-tools-19.0.1': }

  # SDK Platform Android 4.1.2, API 16, revision 4
  # SDK Platform Android 4.0.3, API 15, revision 3
  android::platform{ [ 'android-16', 'android-15' ]: }
  
  $sdk_home = $android::paths::sdk_home
  
  file { "${home}/androidsdk.properties":
    ensure  => present,
    content => template('maestro_demo/androidsdk.properties.erb'),
    owner   => $user,
    group   => $group,
    mode    => '0644',
  }
  
  # add a custom fact
  file { '/etc/facter/facts.d/android.yaml':
    content => "android_version: ${android::version}",
    notify  => Service['maestro-agent'],
  }
}
