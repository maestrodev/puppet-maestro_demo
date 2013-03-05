class maestro_demo::demo::composition::redmine {
  # Add any specific deps here
  # Redmine requires rvm + ruby 1.8.7-p371
  # but installing rvm seems to be causing issues with vagrant provision, so disabled for now
  include rvm

  rvm::system_user { "maestro_agent": }
  rvm_system_ruby { 'ruby-1.8.7-p371':
                      ensure => 'present',
                      default_use => false; }

  # The reason why we don't use the mysql module here is that the redmine
  # composition has some requirements that cannot be satisfied by the mysql
  # module. It removes the root@localhost user for example.

  $mysql_rootpw = 'foobar99'

  package { 'mysql':
    ensure => present,
  }
   
  package { 'mysql-devel':
    ensure => present,
  }

  package { 'mysql-server':
    ensure => present,
  } ->
   
  service { 'mysqld':
    ensure => running,
  } ->
   
  exec { 'mysql-root-password':
    command => "/usr/bin/mysqladmin -u root -h localhost.localdomain password '${mysql_rootpw}'",
    returns => [0,1],
  }
  
  maestro_demo::demo::composition::base { 'redmine': }
}
