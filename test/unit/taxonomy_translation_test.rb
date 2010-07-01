require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class TaxonomyTranslationTest < Test::Unit::TestCase

  context 'taxonomy translations' do
    setup do
      I18n.locale = 'en-US'
      @taxonomy = Factory(:taxonomy, :name => 'english name')                         
      I18n.locale = 'pt-BR'
      @taxonomy.name = 'nome em português'
      @taxonomy.save!
    end
    
    should "translate the name" do
      I18n.locale = 'en-US'
      assert_equal 'english name', @taxonomy.name
      I18n.locale = 'pt-BR'
      assert_equal 'nome em português', @taxonomy.name
    end
  end  
end
