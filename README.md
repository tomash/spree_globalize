# Spree Globalize #

WARNING: Intensive merge and re-work in progress. Do not use for now!

This extension is a work-in-progress merge of jeroenj/spree-product_translations and tomash/globalize_spree to create THE Spree extension for integrating Globalize3.

Makes product details, properties, prototypes, taxonomies and option types translatable by bridging the [Globalize3](https://github.com/svenfuchs/globalize3) gem.

## Installation and configuration ##

In your Gemfile, add:

    gem 'spree_globalize'

Then install the gem:

    bundle install

Finally migrate your database:

    rake db:migrate

If you have pre-existing data, you'll need to run this rake task:

    rake spree:extensions:spree_globalize:globalize_legacy_data

it will copy the original data over to the new translation tables. Globalize3 doesn't default to the original model table for the default locale like v1 used to.

## How to use it ##

To edit the content in a specific language, simply change the locale on the language nav, and edit on the admin as usual.

## Translated fields ##

### Product ###

* name
* description
* meta_description
* meta_keywords

### Property ###

* presentation

### Prototype ###

* name

### Taxonomy ###

* name

### Taxon ###

* name
* description

### OptionType ###

* presentation

### OptionValue ###

* presentation

## Fallbacks for empty translations ##

Should work OOTB.