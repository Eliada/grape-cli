require 'grape/application_factory'
require 'grape/class_name_generator'

class GrapeCli < Thor
  include Thor::Actions

  desc "new APP_NAME", "Create a new Grape application"

  method_option :work_dir, default: Dir.pwd

  def self.source_root
    File.dirname(__FILE__)
  end

  def new(app_name)
    application_template_path = File.join(GrapeCli.source_root, 'template/application')
    destination_path          = File.join(options[:work_dir], app_name)
    config                    = create_config(app_name)

    directory(application_template_path, destination_path, config)

    inside destination_path do
      run(ApplicationFactory.instance.command_generator.bundle_install, config)
    end
  end

  private

  def create_config(app_name)
    {
      app_name: app_name,
      verbose: ApplicationFactory.instance.verbose_output,
      class_name: ClassNameGenerator.new(app_name).generate
    }
  end
end
