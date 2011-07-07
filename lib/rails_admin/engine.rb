require 'rails_admin'
require 'rails'

module RailsAdmin
  class Engine < Rails::Engine
    initializer "static assets" do |app|
      if app.config.serve_static_assets
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end
    end
    initializer "mix RailsAdmin Application helper into main" do |app|
      ActionView::Base.send :include, RailsAdmin::ApplicationHelper
    end
  end
end
