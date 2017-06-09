require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './models/exercise.rb'
require_relative './controllers/exercise_controller.rb'

use Rack::Reloader
use Rack::MethodOverride

run ExercisesController