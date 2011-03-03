class AddDescriptionToTaxonTranslations < ActiveRecord::Migration
  def self.up
    add_column :taxon_translations, :description, :text
  end

  def self.down
    remove_column :taxon_translations, :description
  end
end
