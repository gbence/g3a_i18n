require File.join(File.dirname(__FILE__), 'spec_helper')

describe "G3A::I18n::Backend::ObjectHandler" do
  it "should be a descendant of I18n::Backend::Simple" do
    G3A::I18n::Backend::ObjectHandler.superclass.should == I18n::Backend::Simple
  end

  describe "instance" do
    it "should be an active I18n backend" do
      I18n.backend.should be_kind_of(G3A::I18n::Backend::ObjectHandler)
    end
  end
end
