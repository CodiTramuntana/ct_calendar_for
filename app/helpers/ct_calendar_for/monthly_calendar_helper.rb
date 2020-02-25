module CtCalendarFor
  module MonthlyCalendarHelper
    require 'active_support/core_ext/date/calculations'
    require 'uri'

    def monthly_calendar options
      @start_day = options[:start_day].nil? ? :monday : options[:start_day].to_sym
      @date = options[:month]&.beginning_of_month || Date.current.beginning_of_month
      content_tag :div, class: "row" do
        content_tag :div, class: "col-12" do
          content_tag :table, {class: "table table-bordered bg-white table-sm", style: "table-layout: fixed;"} do
            concat monthly_header options
            concat weekdays_header options
            concat monthly_weeks options
          end
        end
      end
    end

    def monthly_header options
      content_tag :tr, class: "table-dark text-dark" do
        concat content_tag :th, I18n.l(@date, format: "%B"), {colspan: 7, class: ""}
      end
    end

    def weekdays_header options
      first_day_of_week = Date.current.beginning_of_month.beginning_of_week(@start_day)
      content_tag :tr, class: "table-dark text-dark" do
        for i in 1..7 do
          concat content_tag :th, I18n.l(first_day_of_week, format: "%A"), class: ""
          first_day_of_week = first_day_of_week.next_day
        end
      end
    end

    def monthly_weeks options
      weeks.map do |week|
        content_tag :tr, class: "" do
          week.map { |day| monthly_day_cell(day) }.join.html_safe
        end
      end.join.html_safe
    end

    def monthly_day_cell day
      content_tag :td, class: "" do
        content_tag :div, class: "row no-gutters" do
          concat content_tag :div, I18n.l(day, format: "%e"), class: "col-12 border-bottom text-center #{"text-muted" if day.month != @date.month}"
          concat content_tag :div, nil, {class: "col-12", style: "height: 75px;"}
        end
      end
    end

  end
end
