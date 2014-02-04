require 'puppetlabs_spec_helper/module_spec_helper'
require 'json'

RSpec.configure do |c|
  c.default_facts = {
    :kernel => "Linux",
    :postgres_default_version => "90",
    :osfamily => "RedHat",
    :operatingsystem => "CentOS",
    :concat_basedir => "/tmp"
  }

  c.before(:each) do
    Puppet::Util::Log.level = :warning
    Puppet::Util::Log.newdestination(:console)

    # avoid "Only root can execute commands as other users"
    Puppet.features.stubs(:root? => true)
  end
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

shared_examples :compile, :compile => true do
  it { should compile.with_all_deps }
end

def file_content(file)
  should contain_file("/usr/local/maestro/apps/lucee/WEB-INF/config/demo/#{file}.json")
  subject.resource('file', "/usr/local/maestro/apps/lucee/WEB-INF/config/demo/#{file}.json").send(:parameters)[:content]
end

def json_content(file)
  JSON.parse file_content(file)
end
