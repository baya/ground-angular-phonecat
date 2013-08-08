# -*- coding: utf-8 -*-

lib_dir = '/Users/jim/Projects/ground/lib'
$LOAD_PATH.unshift lib_dir unless $LOAD_PATH.include?(lib_dir)

current_dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift current_dir unless $LOAD_PATH.include?(current_dir)

activity_dir = File.expand_path(File.join(File.dirname(__FILE__), 'activities'))
$LOAD_PATH.unshift activity_dir unless $LOAD_PATH.include?(activity_dir)

require 'bundler/setup'
require 'ground'
require 'rack'
require 'logger'
require 'yaml'

Bundler.require(:default)

def load_rbfiles(dir)
  files = File.join(dir, '**', '*.rb')
  Dir.glob(files).each {|file| require file}
end

load_rbfiles('protocol')
load_rbfiles('activities')
load_rbfiles('config')

module PhoneCat

  App = Ground 'phone-cat' do
    use Rack::ShowExceptions
    use Rack::Static, :urls => [""], root: 'app', index: 'index.html'
  end

end
