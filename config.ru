# Start with: shotgun -I. -Ilib
# Under Windows: rackup -I. -Ilib  (CTRL+C and restart on each change)

class App
  def call(env)
    # Return the response array here
    # if env[]
    [
      200,
      {'Content-Type' => 'text/plain'},
      [env['REQUEST_PATH']]
    ]
  end
end

run App.new