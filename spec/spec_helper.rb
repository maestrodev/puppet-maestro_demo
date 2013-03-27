require 'puppetlabs_spec_helper/module_spec_helper'

Puppet::Util::Log.level = :info
Puppet::Util::Log.newdestination(:console)

def file_content(file)
  should contain_file("/usr/local/maestro/apps/lucee/WEB-INF/config/demo/#{file}.json")
  catalogue.resource('file', "/usr/local/maestro/apps/lucee/WEB-INF/config/demo/#{file}.json").send(:parameters)[:content]
end

