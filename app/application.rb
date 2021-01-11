class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == "/items"
      if @@items.include?(item)
        items.each do |n, price|
          return "#{price}"
        end
      else
        resp.status = 400
        resp.write "Item not found"
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
end
