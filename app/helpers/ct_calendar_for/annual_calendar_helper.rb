module CtCalendarFor
  module AnnualCalendarHelper
    require 'uri'

    def annual_calendar options
      @start_day = options[:start_day].nil? ? :monday : options[:start_day].to_sym
      @date = options[:year].nil? ? Date.current.beginning_of_year : Date.new(options[:year].to_i)
      content_tag :div, class: "row bg-white" do
        (1..12).each do |month_num|
          concat months_block
        end
      end
    end

    def months_block
      return content_tag :div, class: "col-4" do
        concat content_tag :div, I18n.l(@date, format: "%B"), class: "py-2 font-weight-bold"
        concat content_tag :div, week_rows, class: "month-wrapper"
        @date = @date.next_month
      end
    end

    def week_rows
      weeks.map do |week|
        content_tag :div, class: "row week-wrapper px-3 no-gutters" do
          week.map { |day| day_cell(day) }.join.html_safe
        end
      end.join.html_safe
    end

    def day_cell(day)
      content_tag :div, class: "col day-wrapper #{day_classes(day)}" do
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

    def complete_date(date)
      I18n.l(date, format: "%A %e, %B, %Y")
    end

    def day_classes(day)
      classes = []
      classes << "today" if day == Date.today
      classes << ("text-muted" if day.month != @date.month)
      classes.empty? ? nil : classes.join(" ")
    end

    def weeks
      first = @date.beginning_of_month.beginning_of_week(@start_day)
      last = @date.end_of_month.end_of_week(@start_day)
      (first..last).to_a.in_groups_of(7)
    end
  end
end
