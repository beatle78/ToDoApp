# config.ru
require 'lotus'
require_relative 'application'

use Rack::Session::Cookie, secret: SecureRandom.hex(64)

run ToDoApp::Application.new