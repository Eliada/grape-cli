class GrapeCli < Thor
  include Thor::Actions

  argument :app_name
  desc "new PROJECT_NAME", "some desc to avoid warning"

  class_option :work_dir, default: Dir.pwd

  def self.source_root
    File.dirname(__FILE__)
  end

  def new
    directory('template', File.join(options[:work_dir], app_name))
  end
end