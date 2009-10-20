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

        @sql = ActiveRecord::Base.connection
        
        # wrapper to deal with differences in result sets from mysql and sqlite
        def fetch_first_row(query)
          result = @sql.execute(query)
          row = result.is_a?(Array) ? result[0][0] : result.fetch_row.first
        end

        puts "updating product names, description, meta_keywords and meta_description..."
        Product.all.each do |p| 
          
          p.name = fetch_first_row("select products.name from products where products.id=#{p.id}")
          p.description = fetch_first_row("select products.description from products where products.id=#{p.id}")
          p.meta_keywords = fetch_first_row("select products.meta_keywords from products where products.id=#{p.id}")
          p.meta_description = fetch_first_row("select products.meta_description from products where products.id=#{p.id}")
          p.save!
        end   
        puts "done."       

        puts "updating taxonomy names..."
        Taxonomy.all.each do |t|
      	  t.name = fetch_first_row("select taxonomies.name from taxonomies where taxonomies.id=#{t.id}")
      	  t.save!
        end
        puts "done."
        
        puts "updating taxon names and permalinks..."
        Taxon.all.each do |t|
      	  t.name = fetch_first_row("select taxons.name from taxons where taxons.id=#{t.id}")
      	  t.permalink = fetch_first_row("select taxons.permalink from taxons where taxons.id=#{t.id}")
      	  t.save!
        end
        puts "done."
        
        puts "updating property presentation..."
        Property.all.each do |p|
      	  p.presentation = fetch_first_row("select properties.presentation from properties where properties.id=#{p.id}")
      	  p.save!
        end
        puts "done."
        
        puts "updating prototype names..."
        Prototype.all.each do |p|
      	  p.name = fetch_first_row("select prototypes.name from prototypes where prototypes.id=#{p.id}")
      	  p.save!
        end
        puts "done."
      end  
    end
  end
end