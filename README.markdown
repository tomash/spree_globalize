# Spree Product Translations #

Makes product details, properties, prototypes, taxonomies and option types translatable by bridging the Globalize 2 plugin.

## Installation and configuration: ##

	script/extension install git://github.com/oliverbarnes/spree-product-translations.git

Install the "Globalize 2 plugin":http://github.com/joshmh/globalize2:

	script/plugin install git://github.com/joshmh/globalize2.git
	
Configure product_translations to load after the localization extension: 

	# config/preinitializer.rb
	SPREE_EXTENSIONS_LOAD_ORDER = [:localization, :product_translations, :all, :site]

Then run 

	rake db:migrate 
	
to create the translation tables defined in the migrations here.

If you have pre-existing data, you'll need to run this rake task:
	
	rake spree:extensions:product_translations:globalize_legacy_data

it will copy the original data over to the new translation tables. Globalize 2 doesn't default to the original model table for the default locale like v1 used to.

## How to use: ##

To edit the content in a specific language, simply change the locale on the language nav, and edit on the admin as usual.

## Translated fields: ##

Product 
	name
	description
	meta_description
	meta_keywords
	
Property
	presentation

Prototype
	name
    
Taxonomy
    name
  
Taxon
	name
	
OptionType
	presentation
	
OptionValue
	presentation

## Running tests ##

You might need to comment out the rspec gem requirement under config/environments/test.rb - for some reason, even with both the rspec gem and plugin installed, I would keep getting an annoying missing gem error.

Spree is officially making a choice for Test::Unit anyway, so this shouldn't create a problem. 

(not that I don't like Rspec, I actually prefer it in other projects.)

## Feature requests and patches welcome ##

If you see anything you need missing, or if you have a useful patch, feel free to submit them on the Issues section of the github project.