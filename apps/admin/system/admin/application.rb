require "dry/web/roda/application"
require_relative "container"

module Admin
  class Application < Dry::Web::Roda::Application
    configure do |config|
      config.container = Container
      config.routes = "web/routes".freeze
    end

    opts[:root] = Pathname(__FILE__).join("../..").realpath.dirname

    use Rack::Session::Cookie, key: "admin.session", secret: self["core.settings"].session_secret

    plugin :csrf, raise: true
    plugin :flash
    plugin :dry_view

    route do |r|
      r.multi_route
    end

    load_routes!
  end
end
