require 'test/unit'
# Load the environment
unless defined? SPREE_ROOT
  ENV["RAILS_ENV"] = "test"
  case
  when ENV["SPREE_ENV_FILE"]
    require File.expand_path(File.dirname(ENV["SPREE_ENV_FILE"]) + "/boot")
  when File.dirname(__FILE__) =~ %r{vendor/spree/vendor/extensions}
    require "#{File.expand_path(File.dirname(__FILE__) + "/../../../../../../")}/config/boot"
  when File.dirname(__FILE__) =~ %r{Sites/spree-product-translations} #for extension dev, using it symlinked
    require "#{File.expand_path(File.dirname(__FILE__) + "/../../../Sites/spree-0.11/")}/config/boot"
  else
    require "#{File.expand_path(File.dirname(__FILE__) + "/../../../../")}/config/boot"
  end
end
require "#{SPREE_ROOT}/test/test_helper"