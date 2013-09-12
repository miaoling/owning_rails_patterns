class UsersController < ApplicationController
  require 'app/models/user'

  def index
    response.write User.all.inspect
  end
end