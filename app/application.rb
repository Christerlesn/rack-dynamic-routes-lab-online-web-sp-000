class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)
      search_term = req.params["item"]
      binding.pry
      if @@items.include?(search_term)
        @@items.each do |price|
          resp.write "#{price}"
        end
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
end
