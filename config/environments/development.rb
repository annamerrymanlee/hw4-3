Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true

  # Enable/disable caching
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Active Storage configuration for development
  config.active_storage.service = :local  # Add this line

  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []

  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true

  config.generators do |generator|
    generator.helper false
    generator.assets false
    generator.test_framework nil
  end
  
  config.hosts = nil

  config.web_console.whiny_requests = false
  config.active_storage.service = :local
end
