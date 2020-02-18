module CtCalendarFor
  class << self
    mattr_accessor :table_for_default_class

    self.table_for_default_class = ""
  end

  # this function maps the vars from your app into your engine
  def self.setup(&block)
    yield self
  end

  class Engine < ::Rails::Engine
    isolate_namespace CtCalendarFor
    paths["app"]

    config.to_prepare do
      ApplicationController.helper(CtCalendarFor::ApplicationHelper)
    end
  end
end
