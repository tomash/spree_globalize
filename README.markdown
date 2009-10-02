= Spree Product Translations

Makes product details, properties and prototypes, as well as taxonomies, translatable using the Globalize 2 plugin. 

## Steps to get it working:

Configure product_translations to load after the localization extension. This is working well for me: 

	config.extensions = [:localization, :product_translations, :static_content, :all, :site]

Install the "Globalize 2 plugin":http://github.com/joshmh/globalize2 :

	script/plugin install git://github.com/joshmh/globalize2.git

(It'll need this "patch":http://gist.github.com/107265 to get translated field values to show on forms. Please see the notes below for more on this bug)

Then run 

	rake db:migrate 
	
to create the translation tables defined in the migrations here.

If you have pre-existing data, you'll need to run this rake task:
	
	rake spree:extensions:product_translations:globalize_legacy_data

it will copy the original data over to the new translation tables. Globalize 2 doesn't default to the original model table for the default locale like v1 used to do:

## How to use:

To edit the content in a specific language, simply change the locale on the language nav, and edit on the admin as usual.

## Translated fields:

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
  description

## Notes

* The current version of Globalize a patch to get translated field values to show on forms. There's a patch available for this, which hasn't been applied to code-base yet:

http://gist.github.com/107265

http://github.com/joshmh/globalize2/issues/#issue/2

* This extension has been tested with Spree 0.8.99 - haven't tested it on 0.9 yet.

* No rspec tests yet.