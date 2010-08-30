require 'spree_core'

module SpreeProductTranslations
  class Engine < Rails::Engine

    def self.activate
      lambda{
        # Activation logic goes here. This should be reserved for doing class_eval on classes that are defined
        # outside of the extension (so that monkey patches are not lost on subsequent requests in development mode.)

        ::Product.class_eval do
          translates :name, :description, :meta_description, :meta_keywords
         end
    
        ::Property.class_eval do
          translates :presentation
        end

        ::Prototype.class_eval do
          translates :name
        end
    
        ::Taxonomy.class_eval do
          translates :name
        end
    
        ::Taxon.class_eval do
          translates :name
        end
    
        ::OptionType.class_eval do
          translates :presentation
        end

        ::OptionValue.class_eval do
          translates :presentation
        end

        # Enable I18n fallbacks
        require "i18n/backend/fallbacks"
      } 
    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.to_prepare &self.activate
  end
end
#  "Makes product details, properties, prototypes and taxonomies translatable using the Globalize 2 plugin"
