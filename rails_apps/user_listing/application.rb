require 'rails'
require 'active_support/railtie'
require "action_controller/railtie"
require 'active_record'

class SingleFile < Rails::Application
  config.session_store :cookie_store, :key => '_session'
  config.secret_key_base = '7893aeb3427daf48502ba09ff695da9ceb3c27daf48b0bba09df'

  Rails.logger = Logger.new($stdout)
end

# Define the Model
class User < ActiveRecord::Base
end

# Define the Controller
class UsersController < ActionController::Base
  prepend_view_path 'views'

  def index
    Rails.logger.info view_paths
    @users = User.all
  end
end

# Define routes
SingleFile.routes.draw do
  root to: 'users#index'
end

###################
# Some setup to connect to Sqlite3 DB
###################
def setup_db
  require 'sqlite3'

  sqlite_db = File.join(File.dirname(__FILE__), 'test.sqlite3')
  db = SQLite3::Database.new( sqlite_db )
  db.execute( "DROP TABLE users;" ) rescue nil

  # Create the table
  db.execute( "CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, email VARCHAR(100), name VARCHAR(100));" )

  # Lets populate some seed data
  db.execute( "INSERT INTO users VALUES(1, 'john@example.com', 'John Doe');" )
  db.execute( "INSERT INTO users VALUES(2, 'jane@example.com', 'Jane Smith');" )

  ActiveRecord::Base.establish_connection(:adapter  => 'sqlite3', :database => sqlite_db)
end

# Run DB setup
setup_db
