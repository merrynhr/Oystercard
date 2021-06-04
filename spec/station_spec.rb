require 'station'
describe Station do
    
  let(:station) { Station.new("Vic", 1)}

  it 'knows its name' do
      expect(station.name).to eq("Vic")
  end

  it 'knows its zone' do
      expect(station.zone).to eq(1)
  end

end