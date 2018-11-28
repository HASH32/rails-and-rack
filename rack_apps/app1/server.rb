require 'rack'

class RunMe
  def call(env)
    code = 200
    headers = { 'Content-Type' => 'text/html' }
    body = ['<h1>Hello Rack!</h1>']
    return [code, headers, body]
  end
end

app = RunMe.new
Rack::Handler::WEBrick.run app


## Running This App ##
#
# Run this by calling the following from console.
#
# ruby server.rb
#
##
