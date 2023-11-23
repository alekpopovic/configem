# frozen_string_literal: true

RSpec.describe Configem do
  it "has a version number" do
    expect(Configem::VERSION).not_to be nil
  end

  describe "include mixin" do
    before do
      @klass = Class.new do 
        include Configem
      end

      @klass.configure do |config|
        config.ex = "include"
      end
    end

    it "include correct conf data" do
      expect(@klass.config.ex).to eq("include")
    end

    it "not include correct conf data" do
      expect(@klass.config.ex).not_to eq("err")
    end
  end

  describe "extend mixin" do
    before do
      @klass = Class.new do 
        extend Configem
      end

      @klass.configure do |config|
        config.ex = "extend"
      end
    end

    it "extend correct conf data" do
      expect(@klass.config.ex).to eq("extend")
    end

    it "not extend correct conf data" do
      expect(@klass.config.ex).not_to eq("err")
    end
  end

  describe "prepend mixin" do
    before do
      @klass = Class.new do 
        prepend Configem
      end

      @klass.configure do |config|
        config.ex = "prepend"
      end
    end

    it "prepend correct conf data" do
      expect(@klass.config.ex).to eq("prepend")
    end

    it "not prepend correct conf data" do
      expect(@klass.config.ex).not_to eq("err")
    end
  end
end
