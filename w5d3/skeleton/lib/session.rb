require 'json'
require 'byebug'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @req = req
    # @cookies = req.cookies
    @cookies = {}
    if req.cookies["_rails_lite_app"]
      @cookies = JSON.parse(req.cookies["_rails_lite_app"])
    else
      @cookies = {}
    end
    # @res = nil
  end

  def [](key)
    # debugger
    @cookies[key]
  end

  def []=(key, val)
    @cookies[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie("_rails_lite_app", {value: @cookies.to_json, path: "/"})
  end
end
