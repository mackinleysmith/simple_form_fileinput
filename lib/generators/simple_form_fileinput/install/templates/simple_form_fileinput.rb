module SimpleForm
  module Inputs
    class FileInput < Base
      def input
        input_html_options[:title] = 'Drop a file here, or click to browse...'
        if input_html_options.key?(:data)
          input_html_options[:data][:filename_placement] = 'inside'
        else
          input_html_options[:data] = {:filename_placement => 'inside'}
        end
        @builder.file_field(attribute_name, input_html_options)
      end
    end
  end
end