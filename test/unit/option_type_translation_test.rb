require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class OptionTypeTranslationTest < Test::Unit::TestCase

  context 'option_type translations' do
    setup do
      I18n.locale = 'en-US'
      @option_type = Factory(:option_type, :presentation => 'english presentation')                         
      I18n.locale = 'pt-BR'
      @option_type.presentation = 'apresentação em português'
      @option_type.save!
    end
    
    should "translate the presentation" do
      I18n.locale = 'en-US'
      assert_equal 'english presentation', @option_type.presentation
      I18n.locale = 'pt-BR'
      assert_equal 'apresentação em português', @option_type.presentation
    end
  end  
end