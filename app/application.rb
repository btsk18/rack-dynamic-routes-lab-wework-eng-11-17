class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)
      item_name = req.path.split("/item/").last
      item = @@items.find { |s| s.name == item_name }
    else
        resp.status = 404
    end

    resp.finish
  end
end
