module Trestle
  class Form
    module Fields
      class DateSelect < Field
        attr_reader :html_options

        def initialize(builder, template, name, options={}, html_options={}, &block)
          super(builder, template, name, options, &block)

          @html_options = default_html_options.merge(html_options)
        end

        def field
          content_tag(:div, class: "date-select") do
            builder.raw_date_select(name, options, html_options, &block)
          end
        end

        def default_html_options
          Trestle::Options.new(class: ["form-control"])
        end
      end
    end
  end
end

Trestle::Form::Builder.register(:date_select, Trestle::Form::Fields::DateSelect)
