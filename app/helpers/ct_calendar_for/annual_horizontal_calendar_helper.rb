module CtCalendarFor
  module AnnualHorizontalCalendarHelper
    require 'uri'

    def annual_horizontal_calendar options
      @start_day = options[:start_day].nil? ? :monday : options[:start_day].to_sym
      @date = options[:year].nil? ? Date.current.beginning_of_year : Date.new(options[:year].to_i)
      content_tag :div, class: "row bg-white" do
        (1..12).each do |month_num|
          concat months_block_horizontal
        end
      end
    end

    def months_block_horizontal
      return content_tag :div, class: "col-12" do
        concat content_tag :div, I18n.l(@date, format: "%B"), class: "py-2 font-weight-bold"
        concat content_tag :div, week_rows_horizontal, class: "month-wrapper"
        @date = @date.next_month
      end
    end

    def week_rows_horizontal
      content_tag :div, class: "row" do
        weeks.map do |week|
          content_tag :div, class: "col row week-wrapper px-3 no-gutters" do
            week.map { |day| day_cell_horizontal(day) }.join.html_safe
          end
        end.join.html_safe
      end
    end

    def day_cell_horizontal(day)
      content_tag :div, class: "day-wrapper col #{day_classes(day)}" do
        content_tag :div, class: "day-content", "data-date": day,
                                                "data-container":"body",
                                                "data-toggle":"popover",
                                                "data-trigger":"hover",
                                                "data-placement":"top",
                                                "data-content": complete_date(day) do
          content_tag :div, day.day, class: "day-inner-content text-center"
        end
      end
    end
  end
end
