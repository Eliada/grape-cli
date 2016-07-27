require 'pry'
require 'test_helper'
require 'tmpdir'
require './lib/grape_cli/grape_cli'
require './lib/grape_cli/application_factory'
require './test/grape_cli/stubs/fake_generator'
require './test/grape_cli/stubs/test_factory'

module GrapeCli
  class CreateTest < Minitest::Test
    def setup
      @folder = Dir.mktmpdir
      @app_name = 'Koszcz'
      @app_folder = File.join(@folder, @app_name)
      ApplicationFactory.instance = TestFactory.new
      GrapeCli::Core.new([@app_name], work_dir: @folder).invoke(:new)
    end

    def teardown
      FileUtils.rm_rf(@folder)
    end

    def test_creates_a_root_folder
      assert Dir.exist?(@app_folder)
    end

    def test_creates_a_gemfile
      assert File.exist?(File.join(@app_folder, 'Gemfile'))
    end

    def test_creates_an_application_folder
      assert File.exist?(File.join(@app_folder, 'app'))
      assert File.directory?(File.join(@app_folder, 'app'))
    end

    def test_copy_default_database_yml
      assert File.exist?(File.join(@app_folder, 'config', 'database.yml'))
    end

    def test_setup_rspec_as_default
      assert File.directory?(File.join(@app_folder, 'spec'))
    end
  end
end
