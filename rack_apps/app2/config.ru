class RunMe
  def call(env)
    code = 200
    headers = { 'Content-Type' => 'text/html' }
    body = ['<h1>Hello Rack!</h1>']
    return [code, headers, body]
  end
end

run RunMe.new



## Running This App ##
#
# Run this by calling the following from console.
#
# rackup config.ru
#
##
