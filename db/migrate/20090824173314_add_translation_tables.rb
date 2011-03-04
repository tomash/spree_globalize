class AddTranslationTables < ActiveRecord::Migration
  def self.up
    Product.create_translation_table! :name => :string, :description => :text, :meta_description => :text, :meta_keywords => :text
    Property.create_translation_table! :presentation => :string
    Prototype.create_translation_table! :name => :string
    Taxonomy.create_translation_table! :name => :string
    Taxon.create_translation_table! :name => :string, :description => :text
    OptionType.create_translation_table! :presentation => :string
    OptionValue.create_translation_table! :presentation => :string
  end

  def self.down
    Product.drop_translation_table!
    Property.drop_translation_table!
    Prototype.drop_translation_table!
    Taxonomy.drop_translation_table!
    Taxon.drop_translation_table!
    OptionType.drop_translation_table!
    OptionValue.drop_translation_table!
  end
end
