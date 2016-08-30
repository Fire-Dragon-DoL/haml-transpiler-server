require "sinatra/base"
require "haml"
require "tilt/haml"

module HamlTranspilerServer
  class CLI < Sinatra::Base
    use Rack::Logger

    configure do
      set :server,  (ENV["HAMLTS_SERVER"] || [:puma, :thin, :webrick])
      set :port,    (ENV["HAMLTS_PORT"] || 5487).to_i
      set :bind,    ENV["HAMLTS_BIND"] || "0.0.0.0"
      set :lock,    false
      pidfile = {}
      pidfile.merge!(pidfile: ENV["HAMLTS_PIDFILE"]) if ENV["HAMLTS_PIDFILE"]
      set :server_settings, {}.merge(pidfile)
    end

    get "/test" do
      204
    end

    post "/path" do
      render_path(params[:path])
    end

    post "/content" do
      render_content(params[:content])
    end

    private

    def render_error(error)
      [500, {}, "#{ error }\n#{ error.backtrace.join("\n") }"]
    end

    def render_path(path)
      logger.info "path: #{ path }"

      raise "File not existent" if path.nil? || !(File.exist?(path.to_s))

      content = File.read(path)
      render_content(content)
    rescue => error
      render_error(error)
    end

    def render_content(content)
      content = content.to_s
      logger.info "content: #{ content }"

      haml content
    rescue => error
      render_error(error)
    end
  end
end
