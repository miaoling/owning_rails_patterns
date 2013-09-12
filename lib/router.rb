class Router
  @@routes = {}
  def initialize(&block)
    instance_eval(&block)
    @@routes
  end
  
  def match(hash)
    # need to look up by url and return hash of controller and action
    @@routes[hash.key] = {}
    @@routes[hash.key][:controller], @@routes[hash.key][:action] = hash.value.split("#")
  end
end

