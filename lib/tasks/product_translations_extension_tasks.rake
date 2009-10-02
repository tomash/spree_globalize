namespace :db do
  desc "Bootstrap your database for Spree."
  task :bootstrap  => :environment do
    # load initial database fixtures (in db/sample/*.yml) into the current environment's database
    ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
    Dir.glob(File.join(ProductTranslationsExtension.root, "db", 'sample', '*.{yml,csv}')).each do |fixture_file|
      Fixtures.create_fixtures("#{ProductTranslationsExtension.root}/db/sample", File.basename(fixture_file, '.*'))
    end
  end
end

namespace :spree do
  namespace :extensions do
    namespace :product_translations do
      desc "Copies pre-existing data to globalize's translation tables"
      task :globalize_legacy_data => :environment do
        I18n.locale = I18n.default_locale

        sql = ActiveRecord::Base.connection

        puts "updating product names, description, meta_keywords and meta_description..."
        Product.all.each do |p| 
          p.name = sql.execute("select products.name from products where products.id=#{p.id}").fetch_row.first
          p.description = sql.execute("select products.description from products where products.id=#{p.id}").fetch_row.first
          p.meta_keywords = sql.execute("select products.meta_keywords from products where products.id=#{p.id}").fetch_row.first
          p.meta_description = sql.execute("select products.meta_description from products where products.id=#{p.id}").fetch_row.first
          p.save!
        end   
        puts "done."       

        puts "updating taxonomy names..."
        Taxonomy.all.each do |t|
      	  t.name = sql.execute("select taxonomies.name from taxonomies where taxonomies.id=#{t.id}").fetch_row.first
      	  t.save!
        end
        puts "done."
        
        puts "updating taxon names and permalinks..."
        Taxon.all.each do |t|
      	  t.name = sql.execute("select taxons.name from taxons where taxons.id=#{t.id}").fetch_row.first
      	  t.permalink = sql.execute("select taxons.permalink from taxons where taxons.id=#{t.id}").fetch_row.first
      	  t.save!
        end
        puts "done."
        
        puts "updating property presentation..."
        Property.all.each do |p|
      	  p.presentation = sql.execute("select properties.presentation from properties where properties.id=#{p.id}").fetch_row.first
      	  p.save!
        end
        puts "done."
        
        puts "updating prototype names..."
        Prototype.all.each do |p|
      	  p.name = sql.execute("select prototypes.name from prototypes where prototypes.id=#{p.id}").fetch_row.first
      	  p.save!
        end
        puts "done."
      end  
    end
  end
end