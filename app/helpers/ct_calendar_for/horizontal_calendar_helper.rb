module CtCalendarFor
  module HorizontalCalendarHelper
    require 'uri'

    def horizontal_calendar options
      @users = options[:users]
      @start_date = options[:start_date] || Date.current
      @end_date = options[:end_date] || @start_date.since(1.month)
      @months_span = @end_date.to_date.month - @start_date.to_date.month
      content_tag :div, class: "row" do
        content_tag :div, class: "col-12" do
          content_tag :table, class: "horizontal_table table table-bordered bg-white table-sm" do
            concat horizontal_header options
            concat horizontal_body options
            @users.each do |user|
              concat user_lines user
            end
          end
        end
      end
    end

    def horizontal_header options
      content_tag :tr, class: "table-dark text-dark" do
        concat content_tag :th, nil, {colspan: 10, class: "empty-cell"}
        for i in 0..@months_span
          month_name = l(@start_date.to_date.beginning_of_month.since(i.months), format: '%B')
          month_days = if @months_span.zero?
            (@end_date.to_date - @start_date.to_date).to_i + 1
          elsif i == @months_span
            (@end_date.to_date - @end_date.to_date.beginning_of_month).to_i + 1
          elsif i.zero?
            (@start_date.to_date.end_of_month - @start_date.to_date).to_i + 1
          else
            (@start_date.to_date.since(i.months).end_of_month - @start_date.to_date.since(i.months).beginning_of_month).to_i + 1
          end
          concat content_tag  :th,
                              month_name,
                              {colspan: month_days, class: ""}
        end
      end
    end

    def horizontal_body options
      options[:search_attribute] ||= "name"
      options[:search_placeholder] ||= "Search"
      content_tag :tr, class: "table-dark text-dark" do
        concat content_tag :th, search_form_cell(options), {colspan: 10, class: "empty-cell"}
        (@start_date.to_date..@end_date.to_date).each do |date|
          concat content_tag :th, date.day, class: "text-center"
        end
      end
    end

    def search_form_cell options
      if !options[:search?].nil? && options[:search?]
        return search_form_for options[:object], url: options[:url] do |f|
          content_tag :div, class: "row" do
            content_tag :div, class: "col-12 user-search-wrapper" do
              concat f.search_field "#{options[:search_attribute]}_cont".to_sym, :class => "form-control search-field rounded-search-field", placeholder: options[:search_placeholder]
              concat button_tag type: "submit", class: "btn special-search-btn" do
                content_tag :i, nil, class: "fa fa-search"
              end
            end
          end
        end
      end
    end

    def user_lines user
      return content_tag :tr do
        concat content_tag :td, user.name, {colspan: 10, class: "cell-name pl-3 table-active border-dark"}
        (@start_date.to_date..@end_date.to_date).each do |date|
          concat content_tag :td, content_tag(:div, nil,class: "hz-calendar-ball"), class: ""
        end
      end
    end
  end
end
