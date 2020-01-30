require "station.rb"

describe Station do

  subject {described_class.new("Brixton", 2)}

  context " #name" do
    it "should return name of station" do
      expect(subject.name).to eq "Brixton"
    end
  end

  context " #zone" do
    it "should return zone based on argument given" do
    expect(subject.zone).to eq 2
    end
  end
end