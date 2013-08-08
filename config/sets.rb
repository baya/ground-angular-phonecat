Ground do
  set :root, File.expand_path(File.dirname(File.dirname(__FILE__)))
  set :env, (ENV['RACK_ENV'] || 'development').to_s
  set :log_file, File.join(root, "logs", "#{env}.log")
  set :logger, ::Logger.new(log_file)
end
