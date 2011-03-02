namespace :spree do
  namespace :extensions do
    namespace :product_translations do
      desc "Copies pre-existing data to globalize's translation tables"
      task :globalize_legacy_data => :environment do
        I18n.locale = I18n.default_locale

        @sql = ActiveRecord::Base.connection

        # wrapper to deal with differences in result sets from mysql, sqlite and postgres
        def fetch_first_row(query)
          result = @sql.execute(query)
          row = if defined?(PGresult) && result.is_a?(PGresult) #postgres
                  result.getvalue(0,0)
                elsif result.is_a?(Array) #sqlite
                  result[0][0]
                elsif defined?(Mysql2::Result) && result.is_a?(Mysql2::Result) #mysql2
                  result.first.first
                else #mysql
                  result.fetch_row.first
                end
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
          t.save!
        end
        puts "done."

        puts "updating property presentations..."
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

        puts "updating option type presentations..."

        OptionType.all.each do |p|
          p.presentation = fetch_first_row("select option_types.presentation from option_types where option_types.id=#{p.id}")
          p.save!
        end
        puts "done."

        OptionValue.all.each do |p|
          p.presentation = fetch_first_row("select option_values.presentation from option_values where option_values.id=#{p.id}")
          p.save!
        end
        puts "done."
      end
    end
  end
end
