class Application

  # @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)
      item_name = req.path.split("/item/").last
      item = @@items.find { |s| s.name == item_name }
      resp.write item.price if item.name != nil
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
