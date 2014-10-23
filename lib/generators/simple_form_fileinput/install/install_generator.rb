require 'rails/generators'

module SimpleFormFileinput
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "Installs SimpleFormFileinput"

      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), 'templates')
      end

      def copy_initializer
        copy_file 'simple_form_fileinput.rb', 'config/initializers/simple_form_fileinput.rb'
        inject_into_file 'app/assets/javascripts/application.js',  :before => '//= require_tree .' do
          "//= require simple_form_fileinput/init\n"
        end
        inject_into_file 'app/assets/stylesheets/application.css', :before => ' *= require_self' do
          " *= require simple_form_fileinput/enhancements\n"
        end
      end

    end
  end
end