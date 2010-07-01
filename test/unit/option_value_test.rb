require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class OptionValueTranslationTest < Test::Unit::TestCase

  context 'option value translations' do
    setup do
      I18n.locale = 'en-US'
      @option_value = Factory(:option_value, :presentation => 'english presentation')                         
      I18n.locale = 'pt-BR'
      @option_value.presentation = 'apresentação em português'
      @option_value.save!
    end
    
    should "translate the presentation" do
      I18n.locale = 'en-US'
      assert_equal 'english presentation', @option_value.presentation
      I18n.locale = 'pt-BR'
      assert_equal 'apresentação em português', @option_value.presentation
    end
  end  
end