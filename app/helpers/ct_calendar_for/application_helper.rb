module CtCalendarFor
  module ApplicationHelper
    require 'uri'
    include HorizontalCalendarHelper
    include AnnualBlocksCalendarHelper
    include AnnualHorizontalCalendarHelper

    def calendar_for calendar_type, options: {}
      if calendar_type == :annual_blocks
        annual_blocks_calendar options
      elsif calendar_type == :annual_horizontal
        annual_horizontal_calendar options
      elsif calendar_type == :horizontal
        horizontal_calendar options
      end
    end

    private

    def complete_date(date)
      I18n.l(date, format: "%A %e, %B, %Y")
    end

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
