require 'spec_helper'

describe 'maestro_demo' do
  let(:facts) {{
    :kernel => "Linux",
    :postgres_default_version => "90",
    :osfamily => "RedHat",
  }}

  context "centrepoint when not using sonar, archiva" do
    let(:params) {{ }}
    let(:title) { 'centrepoint' }

    it "should generate centrepoint demo composition without sonar goals using install" do
      file_content("centrepoint").should include "mvn install"
      file_content("centrepoint").should_not include "org.codehaus.mojo:sonar-maven-plugin:2.0:sonar"
    end
    it "should use the right working copy directory" do
      file_content("centrepoint").should include '/var/local/maestro-agent/wc'
      file_content("centrepoint").should_not include '/home/agent'
    end
  end

  #context "hello ivy" do
    #let(:params) {{ }}
    #let(:title) { 'antwithivy' }
    # it "should generate ivy demo composition without sonar goals using install" do
    #   file_content("antwithivy").should include '"tasks": {
    #                         "required": true, 
    #                         "type": "Array", 
    #                         "value": [
    #                             "install"
    #                         ]
    #                     }'
    # end
    #it "should use the right working copy directory" do
      # file_content("antwithivy").should include '/var/local/maestro-agent/wc'
      # file_content("antwithivy").should_not include '/home/agent'
    #end
  #end

  context "wordpress when not using irc" do
    let(:params) {{ }}
    let(:title) { 'wordpress' }

    it "should use the right working copy directory" do
      file_content("wordpress").should include '/var/local/maestro-agent/wc'
      file_content("wordpress").should_not include '/home/agent'
    end
    it "shouldn't have irc task" do
      file_content("wordpress").should_not include "irc"
    end
  end

  context "centrepoint when using sonar and archiva" do
    let(:params) {{ :use_sonar => true, :use_archiva => true }}
    let(:title) { 'centrepoint' }

    it "should generate demo composition with sonar goals using deploy" do
      file_content("centrepoint").should =~ /org.codehaus.mojo:sonar-maven-plugin:2.0:sonar/
      file_content("centrepoint").should =~ /mvn deploy/
    end
  end
end
