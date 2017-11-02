require 'erb'

class ShowExceptions
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    exceptions = render_exception(env)
    app.call(env)
  end

  private

  def render_exception(e)
    req = Rack::Request.new(e)
    Rack::ShowExceptions

  end

end
