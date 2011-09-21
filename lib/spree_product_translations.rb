require 'spree_core'
require 'globalize3'

module SpreeProductTranslations
  class Engine < Rails::Engine
    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end

      @@fallbacks_for_empty_translations = Spree::Config[:fallbacks_for_empty_translations] != '0' # Booelans are stored as an int as a string

      ::Product.class_eval do
        translates :name, :description, :meta_description, :meta_keywords, :fallbacks_for_empty_translations => @@fallbacks_for_empty_translations
      end

      ::Property.class_eval do
        translates :presentation, :fallbacks_for_empty_translations => @@fallbacks_for_empty_translations
      end

      ::Prototype.class_eval do
        translates :name, :fallbacks_for_empty_translations => @@fallbacks_for_empty_translations
      end

      ::Taxonomy.class_eval do
        translates :name, :fallbacks_for_empty_translations => @@fallbacks_for_empty_translations
      end

      ::Taxon.class_eval do
        translates :name, :description, :fallbacks_for_empty_translations => @@fallbacks_for_empty_translations
      end

      ::OptionType.class_eval do
        translates :presentation, :fallbacks_for_empty_translations => @@fallbacks_for_empty_translations
      end

      ::OptionValue.class_eval do
        translates :presentation, :fallbacks_for_empty_translations => @@fallbacks_for_empty_translations
      end

      # Enable I18n fallbacks
      require 'i18n/backend/fallbacks'
    end

    config.to_prepare &method(:activate).to_proc
  end
end
