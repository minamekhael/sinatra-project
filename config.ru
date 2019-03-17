require_relative './config/enviornment'
require './config/enviornment'

use Rack::MethodOverride 
use ReviewsController
use UsersController
run ApplicationController