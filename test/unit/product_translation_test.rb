require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class ProductTranslationTest < Test::Unit::TestCase

  context 'product translations' do
    setup do
      I18n.locale = 'en-US'
      @product = Factory(:product, 
                         :name => 'english name',
                         :description => 'english description',
                         :meta_description => 'english meta_description', 
                         :meta_keywords => 'english meta_keywords'
                         )                         
      I18n.locale = 'pt-BR'
      @product.name = 'nome em português'
      @product.description = 'descrição em português'
      @product.meta_description = 'meta descrição em português'
      @product.meta_keywords = 'meta palavras-chave em português'
      @product.save!
    end
    
    should "translate the name" do
      I18n.locale = 'en-US'
      assert_equal 'english name', @product.name
      I18n.locale = 'pt-BR'
      assert_equal 'nome em português', @product.name
    end

    should "translate the description" do
      I18n.locale = 'en-US'
      assert_equal 'english description', @product.description
      I18n.locale = 'pt-BR'
      assert_equal 'descrição em português', @product.description
    end
    
    should "translate the meta_description" do
      I18n.locale = 'en-US'
      assert_equal 'english meta_description', @product.meta_description
      I18n.locale = 'pt-BR'
      assert_equal 'meta descrição em português', @product.meta_description
    end
    
    should "translate the meta_keywords" do
      I18n.locale = 'en-US'
      assert_equal 'english meta_keywords', @product.meta_keywords
      I18n.locale = 'pt-BR'
      assert_equal 'meta palavras-chave em português', @product.meta_keywords
    end
    
    should "use default locale fallback when a translation is missing" do
      I18n.locale = 'en-US'
      @untranslated_product = Factory(:product, :name => 'name of product')  
      I18n.locale = 'pt-BR'
      assert_equal 'name of product', @untranslated_product.name
    end
  end  
end
