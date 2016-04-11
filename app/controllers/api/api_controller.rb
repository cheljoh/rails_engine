module Api
  class ApiController < ApplicationController #will prolly want methods from app controller, like current user. Could also inherit from actioncontroller:base
    protect_from_forgery with: :null_session #NEED THIS
  end
end
