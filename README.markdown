# Spree Product Translations #

Makes product details, properties, prototypes and taxonomies translatable by bridging the Globalize 2 plugin.

## Installation and configuration: ##

	script/extension install git://github.com/oliverbarnes/spree-product-translations.git

Install the "Globalize 2 plugin":http://github.com/joshmh/globalize2:

	script/plugin install git://github.com/joshmh/globalize2.git
	
Configure product_translations to load after the localization extension. This is working well for me: 

	config.extensions = [:localization, :product_translations, :all, :site]

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
	permalink # though I can't find where this is editable on the admin, just in case it does become at some point

## TODO ##

* Tests