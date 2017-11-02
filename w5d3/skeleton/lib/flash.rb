require 'json'

class Flash

  def initialize(req)
    @req = req
    @flash = {}
    @now = false
    if req.cookies['_rails_lite_app_flash']
      @flash['_rails_lite_app_flash_old'] = JSON.parse(req.cookies['_rails_lite_app_flash'])
    end
    @flash['_rails_lite_app_flash'] = {}
    @flash['_rails_lite_app_flash_now'] = {}
  end

  def [](key)
    if @now
      result = @flash['_rails_lite_app_flash_now'][key.to_s]
    else
      result = @flash['_rails_lite_app_flash'][key.to_s]
    end
    @now = false
    return result if result
    now = @flash['_rails_lite_app_flash_now'][key.to_s]
    return now if now
    @flash['_rails_lite_app_flash_old'][key.to_s]
  end

  def []=(key, val)
    if @now
      result = @flash['_rails_lite_app_flash_now'][key.to_s] = val
    else
      result = @flash['_rails_lite_app_flash'][key.to_s] = val
    end
    @now = false
    result
  end

  def store_flash(res)
    res.set_cookie("_rails_lite_app_flash", {value: @flash["_rails_lite_app_flash"].to_json, path: "/"})
  end

  def now
    @now = true
    self
  end

end
