$:.push(File.dirname(__FILE__))
require 'rubygems'
require 'bundler'

Bundler.require(:default)
require 'sass/plugin/rack'
require 'canvas_tutorial'

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

use Rack::Coffee, root: 'public', urls: '/javascripts'

set :root, File.dirname(__FILE__)
set :public_folder, 'public'

run CanvasTutorialApp