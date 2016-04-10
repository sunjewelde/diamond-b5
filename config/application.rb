require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'
# require "bundler/capistrano"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# module DiamondB3
module Code3
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.active_job.queue_adapter = :sidekiq
  end
end
