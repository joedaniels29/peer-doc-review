PeerDocReview::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log
  config.ember.app_name = 'App'
  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  ##config.ember.variant - Used to determine which Ember variant to use. Valid options: :development, :production.
  #config.ember.app_name - Used to specify a default application name for all generators.
  #config.ember.ember_path - Used to specify a default custom root path for all generators.
  #config.handlebars.precompile - Used to enable or disable precompilation. Default value: true.
  #config.handlebars.templates_root - Set the root path (under app/assets/javascripts) for templates to be looked up in. Default value: "templates".
  #config.handlebars.templates_path_separator - The path separator to use for templates. Default value: '/'.
  #config.handlebars.output_type - Configures the style of output (options are :amd and :global). Default value: :global.

  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  Paperclip.options[:command_path] = '/usr/local/bin/'
end
