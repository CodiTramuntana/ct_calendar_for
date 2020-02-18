module CtCalendarFor
  module ApplicationHelper
    require 'uri'
    include HorizontalCalendarHelper

    def calendar_for calendar_type, options: {}
      if calendar_type == :anual

      elsif calendar_type == :horizontal
        horizontal_calendar options
      end
    end

    private

    def uri?(string)
      # http://ruby-doc.org/stdlib-2.4.0/libdoc/uri/rdoc/URI.html
      uri = URI.parse(string)
      %w( http https ).include?(uri.scheme)
    rescue URI::BadURIError
      false
    rescue URI::InvalidURIError
      false
    end

    def parse_extras(extras)
      Hash[extras.collect { |extra| [extra.split(":").first, extra.split(":").last] } ].with_indifferent_access
    end
  end
end
