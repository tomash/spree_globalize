class AddDescriptionToTaxonTranslations < ActiveRecord::Migration
  def self.up
    add_column :taxon_translations, :description, :text unless column_exists?(:taxon_translations, :description)
  end

  def self.down
    remove_column :taxon_translations, :description
  end
end
