require_relative 'production'

SmalrubyEditor::Application.configure do
  if !ENV['SMALRUBY_EDITOR_HOME']
    fail 'you must set SMALRUBY_EDITOR_HOME environment variable.'
  end
  home_dir = Pathname(ENV['SMALRUBY_EDITOR_HOME']).expand_path
  config.paths.add 'config/database', with: home_dir.join('config/database.yml')
  config.paths.add 'log', with: home_dir.join("log/#{Rails.env}.log")
  config.paths.add 'tmp', with: home_dir.join('tmp')
  config.paths.add 'tmp/cache', with: home_dir.join('tmp/cache')

  config.serve_static_assets = true
  config.log_level = :warn
end