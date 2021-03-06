module ActiveAdmin
  module Inputs
    class DatepickerInput < ::Formtastic::Inputs::StringInput
      def input_html_options
        super.tap do |options|
          options[:class] = [options[:class], "datepicker"].compact.join(' ')
          options[:data] ||= {}
          options[:data].merge! datepicker_options
        end
      end

      private
        def datepicker_options
          options = self.options.fetch(:datepicker_options, {})
          options = Hash[options.map{ |k, v| [k.to_s.camelcase(:lower), v] }]
          { datepicker_options: options }
        end
    end
  end
end
