require File.join(File.dirname(__FILE__), '..', 'spec_helper')

context "Hungarian" do

  before(:each) do
    I18n.locale = :hu
  end

  describe "Integer" do
    it "can be localized" do
      lambda { I18n.l 1 }.should_not raise_error
      lambda { I18n.localize 1 }.should_not raise_error
    end

    it "can be translated" do
      lambda { I18n.t 1 }.should_not raise_error
      lambda { I18n.translate 1 }.should_not raise_error
    end

    {
      0 => 'nulla',
      1 => 'egy',
      2 => 'kettő',
      10 => 'tíz',
      11 => 'tizenegy',
      12 => 'tizenkettő',
      20 => 'húsz',
      22 => 'huszonkettő',
      23 => 'huszonhárom',
      12 => 'tizenkettő',
      100 => 'száz',
      101 => 'százegy',
      110 => 'száztíz',
      123 => 'százhuszonhárom',
      201 => 'kétszázegy',
      1001 => 'ezeregy',
      1010 => 'ezertíz',
      1011 => 'ezertizenegy',
      1100 => 'ezerszáz',
      1234 => 'ezerkétszázharmincnégy',
      1999 => 'ezerkilencszázkilencvenkilenc',
      2000 => 'kétezer',
      2001 => 'kétezer-egy',
      22222 => 'huszonkétezer-kétszázhuszonkettő',
      100001 => 'százezer-egy',
      200000 => 'kétszázezer',
      2000000 => 'kétmillió',
      2200000 => 'kétmillió-kétszázezer',
      2200001 => 'kétmillió-kétszázezer-egy',
      2_000_000_001 => 'kétmilliárd-egy',
      2_000_000_000 => 'kétmilliárd',
      2_000_000_000_000 => 'kétbillió',
      2_000_200_000_000 => 'kétbillió-kétszázmillió',
      2_000_000_200_000 => 'kétbillió-kétszázezer',
      2_002_020_200_222 => 'kétbillió-kétmilliárd-húszmillió-kétszázezer-kétszázhuszonkettő',
      12_345_678_901_234_567_890 => 'tizenkéttrillió-háromszáznegyvenötbilliárd-hatszázhetvennyolcbillió-kilencszázegymilliárd-kétszázharmincnégymillió-ötszázhatvanhétezer-nyolcszázkilencven',
      -12_345_678_901_234_567_890 => 'mínusz tizenkéttrillió-háromszáznegyvenötbilliárd-hatszázhetvennyolcbillió-kilencszázegymilliárd-kétszázharmincnégymillió-ötszázhatvanhétezer-nyolcszázkilencven'
    }.each do |number,translation|
      instance_eval <<-EOC
        describe #{number}.to_s do
          it "should equal to '#{translation}'" do
            I18n.translate(#{number}).should == "#{translation}"
          end
        end
      EOC
    end
  end
end
