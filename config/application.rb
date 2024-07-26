require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RealEstate
  class Application < Rails::Application
    # In order for Graphiti to generate links, you need to set the routes host.
    # When not explicitly set, via the HOST env var, this will fall back to
    # the rails server settings.
    # Rails::Server is not defined in console or rake tasks, so this will only
    # use those defaults when they are available.

    routes.default_url_options[:host] = ENV.fetch('HOST') do
      if defined?(Rails::Server)
        argv_options = Rails::Server::Options.new.parse!(ARGV)
        "http://#{argv_options[:Host]}:#{argv_options[:Port]}"
      end
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.session_store :cookie_store, key: '_interslice_session'
    config.api_only = true

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:8080'
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          credentials: true,
          expose: ['Authorization']
      end
    end

  end
end
