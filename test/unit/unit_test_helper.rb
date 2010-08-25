require 'test/unit'
require 'mocha'

require File.join(File.dirname(__FILE__), '..', '..', 'init.rb')
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'this_card')
require File.join(File.dirname(__FILE__), 'fixture_loader')

class Test::Unit::TestCase

  def project(name)
    @project ||= load_project_fixture(name)
  end

  def projects(*names)
    @projects ||= names.map { |name| load_project_fixture(name) }
  end

  private

  def load_project_fixture(name)
    FixtureLoaders::ProjectLoader.new(name).project
  end

end

