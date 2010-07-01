require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class PropertyTranslationTest < Test::Unit::TestCase

  context 'property translations' do
    setup do
      I18n.locale = 'en-US'
      # spree 0.11 doesn't have a factory for Property
      @property = Property.new(:name => "some name for validation", :presentation => 'english presentation')                         
      I18n.locale = 'pt-BR'
      @property.presentation = 'apresentação em português'
      @property.save!
    end
    
    should "translate the presentation" do
      I18n.locale = 'en-US'
      assert_equal 'english presentation', @property.presentation
      I18n.locale = 'pt-BR'
      assert_equal 'apresentação em português', @property.presentation
    end
  end  
end
