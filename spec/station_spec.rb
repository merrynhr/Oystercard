require 'station'
describe Station do
    
  subject(:station) { described_class.new("Vic", 1)}

  it 'knows its name' do
      expect(subject.name).to eq("Vic")
  end

  it 'knows its zone' do
      expect(subject.zone).to eq(1)
  end

end