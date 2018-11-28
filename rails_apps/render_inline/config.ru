require 'rails'
require 'action_controller/railtie'

class SingleFile < Rails::Application
  config.session_store :cookie_store, :key => '_session'
  config.secret_key_base = '7893aeb3427daf48502ba09ff695da9ceb3c27daf48b0bba09df'

  Rails.logger = Logger.new($stdout)
end


class PagesController < ActionController::Base
  def index
    render inline:
      "
        <h1>Hello World!</h1>
        <p>I'm just a single file Rails application</p>
      "
  end
end


SingleFile.routes.draw do
  root to: "pages#index"
end

run SingleFile
