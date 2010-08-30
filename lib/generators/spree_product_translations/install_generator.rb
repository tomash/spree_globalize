module SpreeProductTranslations
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Configures an existing Spree based application to use spree_product_translations"

      def copy_migrations
        directory "db"
      end


    end
  end
end
