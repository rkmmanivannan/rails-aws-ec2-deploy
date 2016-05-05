Rails.application.configure do
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

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  ENV["TWITTER_CONSUMER_KEY"]     = 'QcLYsqTzmQNyVw86ifgfKexKp';
  ENV["TWITTER_CONSUMER_SECRET"]  = 'xW1RuX59U5n0fKwxbaGfPXhXBxcj7ut3l11R4sZviBRKDrsJej';
  ENV["FACEBOOK_CONSUMER_KEY"]    = '1592488157745426';
  ENV["FACEBOOK_CONSUMER_SECRET"] = 'd4c09c39e2cb4d492b226cb943a66339';
  ENV["GITHUB_CONSUMER_KEY"]      = 'f5fb02e1bb5765356f0a';
  ENV["GITHUB_CONSUMER_SECRET"]   = '9586e09debfd3e4cea2574cfd35dd54f25330c85';

end
