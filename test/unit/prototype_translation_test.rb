require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class PrototypeTranslationTest < Test::Unit::TestCase

  context 'prototype translations' do
    setup do
      I18n.locale = 'en-US'
      # spree 0.11 doesn't have a factory for Prototype
      @prototype = Prototype.new(:name => 'english name')                         
      I18n.locale = 'pt-BR'
      @prototype.name = 'nome em português'
      @prototype.save!
    end
    
    should "translate the name" do
      I18n.locale = 'en-US'
      assert_equal 'english name', @prototype.name
      I18n.locale = 'pt-BR'
      assert_equal 'nome em português', @prototype.name
    end
  end  
end
