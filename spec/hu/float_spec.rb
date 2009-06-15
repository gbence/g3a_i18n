require File.join(File.dirname(__FILE__), '..', 'spec_helper')

context "Hungarian" do

  before(:each) do
    I18n.locale = :hu
  end

  describe "Float" do
    it "should be localized" do
      lambda { I18n.l 0.1 }.should_not raise_error
      lambda { I18n.localize 0.1 }.should_not raise_error
    end

    {
      0.0 => 'nulla',
      1.0 => 'egy',
      1.0+(1.0/6.0) => 'egy és egy hatod',
      1.25 => 'egy és egy negyed',
      1.0+(1.0/3.0) => 'egy és egy harmad',
      1.5 => 'egy és fél',
      1.0+(2.0/3.0) => 'egy és két harmad',
      1.75 => 'egy és három negyed',
      1.0+(5.0/6.0) => 'egy és öt hatod',
      2.0 => 'kettő',
      2.25 => 'két és egy negyed',
      2.5 => 'két és fél',
      2.75 => 'két és három negyed',
      2.666 => 'két egész hatszázhatvanhat ezred',
      2.666666 => 'két egész hatszázhatvanhatezer-hatszázhatvanhat milliomod',
      10.0 => 'tíz',
      10.1 => 'tíz egész egy tized',
      10.11 => 'tíz egész tizenegy század',
      10.101 => 'tíz egész százegy ezred',
      10.0001 => 'tíz egész egy tízezred',
      10.00001 => 'tíz egész egy százezred',
      10.100001 => 'tíz egész százezer-egy milliomod',
      1234.6666666666666 => 'ezerkétszázharmincnégy és két harmad',
      1234.1234 => 'ezerkétszázharmincnégy egész ezerkétszázharmincnégy tízezred'
      #10.1234567 => 'tíz egész egy-kettő-három-négy-öt-hat-hét',
      #-10.1234567 => 'mínusz tíz egész egy-kettő-három-négy-öt-hat-hét'
    }.each do |number,localization|
      instance_eval <<-EOC
        describe #{number}.to_s do
          it "should equal to '#{localization}'" do
            I18n.localize(#{number}).should == "#{localization}"
          end
        end
      EOC
    end
  end
end
