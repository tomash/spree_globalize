require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class TaxonTranslationTest < Test::Unit::TestCase

  context 'taxon translations' do
    setup do
      I18n.locale = 'en-US'
      @taxon = Factory(:taxon, :name => 'english name')                         
      I18n.locale = 'pt-BR'
      @taxon.name = 'nome em português'
      @taxon.save!
    end
    
    should "translate the name" do
      I18n.locale = 'en-US'
      assert_equal 'english name', @taxon.name
      I18n.locale = 'pt-BR'
      assert_equal 'nome em português', @taxon.name
    end
  end  
end
