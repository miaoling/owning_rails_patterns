# Start with: shotgun -I. -Ilib
# Under Windows: rackup -I. -Ilib  (CTRL+C and restart on each change)

class App
  def call(env)
    # Return the response array here
    response = []
    if env['REQUEST_METHOD'] == "GET"
      response << get(env)
    else
      response << env['REQUEST_PATH']
    end
    [
      200,
      {'Content-Type' => 'text/plain'},
      response
    ]
  end
  
  def get(env)
    if env["REQUEST_PATH"] == "/hi"
      "Owning!"
    else
      env['REQUEST_PATH']
    end
  end
end

Routes = {
  "GET"  => {}
}

get "/" do
  "Hi there"
end

run App.new

# {"GATEWAY_INTERFACE"=>"CGI/1.1", "PATH_INFO"=>"/asdf", "QUERY_STRING"=>"", "REMOTE_ADDR"=>"127.0.0.1", "REMOTE_HOST"=>"localhost", "REQUEST_METHOD"=>"GET", "REQUEST_URI"=>"http://localhost:9292/asdf", "SCRIPT_NAME"=>"", "SERVER_NAME"=>"localhost", "SERVER_PORT"=>"9292", "SERVER_PROTOCOL"=>"HTTP/1.1", "SERVER_SOFTWARE"=>"WEBrick/1.3.1 (Ruby/2.0.0/2013-06-27)", "HTTP_HOST"=>"localhost:9292", "HTTP_CONNECTION"=>"keep-alive", "HTTP_CACHE_CONTROL"=>"max-age=0", "HTTP_ACCEPT"=>"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "HTTP_USER_AGENT"=>"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36", "HTTP_ACCEPT_ENCODING"=>"gzip,deflate,sdch", "HTTP_ACCEPT_LANGUAGE"=>"en-US,en;q=0.8", "HTTP_COOKIE"=>"_website_session=BAh7B0kiD3Nlc3Npb25faWQGOgZFRkkiJWVkNTNhZDcwYjI5ZDQ1ZjE1ODQ1ZDJkNTdiZGJkMTI5BjsAVEkiEF9jc3JmX3Rva2VuBjsARkkiMWk0bFRKdVdJSXl1YngzaUxaa0JnejlwaGhBYzRnZEcrUHNONnZFdnRtUkk9BjsARg%3D%3D--eaa3ebb91abb9681253b3f97bc838a4754e12c44", "rack.version"=>[1, 2], "rack.input"=>#<Rack::Lint::InputWrapper:0x007f91dcbbb820 @input=#<StringIO:0x007f91dcbb3b20>>, "rack.errors"=>#<Rack::Lint::ErrorWrapper:0x007f91dcbbb7a8 @error=#<IO:<STDERR>>>, "rack.multithread"=>true, "rack.multiprocess"=>false, "rack.run_once"=>false, "rack.url_scheme"=>"http", "HTTP_VERSION"=>"HTTP/1.1", "REQUEST_PATH"=>"/asdf"}