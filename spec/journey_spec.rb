require 'journey'

describe Journey do 
    
  journey = Journey.new("Brixton", "Bank")
  it 'should return brixton as entry station' do 
      
      expect(journey.entry_station).to eq ("Brixton")
  end 

    context ' #exit_station' do
    it 'should return the exit station' do 
      expect(journey.exit_station).to eq ("Bank")
    end     
  end 


end 
