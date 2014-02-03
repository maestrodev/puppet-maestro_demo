require 'puppetlabs_spec_helper/module_spec_helper'
require 'json'

RSpec.configure do |c|
  c.before(:each) do
    Puppet::Util::Log.level = :warning
    Puppet::Util::Log.newdestination(:console)
  end
end


def file_content(file)
  should contain_file("/usr/local/maestro/apps/lucee/WEB-INF/config/demo/#{file}.json")
  subject.resource('file', "/usr/local/maestro/apps/lucee/WEB-INF/config/demo/#{file}.json").send(:parameters)[:content]
end

def json_content(file)
  JSON.parse file_content(file)
end
