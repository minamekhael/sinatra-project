require_relative './config/enviornment'
require './config/enviornment'

use Rack::MethodOverride 
use PostsController
use SessionsController
use UsersController
run ApplicationController