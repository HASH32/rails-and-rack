require 'rails'
require "action_controller/railtie"

class SingleFile < Rails::Application
  config.session_store :cookie_store, :key => '_session'
  config.secret_key_base = '7893aeb3427daf48502ba09ff695da9ceb3c27daf48b0bba09df'

  Rails.logger = Logger.new($stdout)

  routes.draw do
    root to: proc {|env| [200, {}, ["Hello world"]] }
  end
end

run SingleFile
