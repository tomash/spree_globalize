require 'spree_core'
require 'globalize3'

module SpreeProductTranslations
  class Engine < Rails::Engine
    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end

      ::Product.class_eval do
        translates :name, :description, :meta_description, :meta_keywords, :fallbacks_for_empty_translations => true
      end

      ::Property.class_eval do
        translates :presentation, :fallbacks_for_empty_translations => true
      end

      ::Prototype.class_eval do
        translates :name, :fallbacks_for_empty_translations => true
      end

      ::Taxonomy.class_eval do
        translates :name, :fallbacks_for_empty_translations => true
      end

      ::Taxon.class_eval do
        translates :name, :description, :fallbacks_for_empty_translations => true
      end

      ::OptionType.class_eval do
        translates :presentation, :fallbacks_for_empty_translations => true
      end

      ::OptionValue.class_eval do
        translates :presentation, :fallbacks_for_empty_translations => true
      end

      # Enable I18n fallbacks
      require 'i18n/backend/fallbacks'
    end

    config.to_prepare &method(:activate).to_proc
  end
end
