require_relative './config/enviornment'
require './config/enviornment'

use Rack::MethodOverride 
use PostsController
use SessionsController
run ApplicationController