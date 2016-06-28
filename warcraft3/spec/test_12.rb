require_relative 'spec_helper'

#Enhancement 3 SiegeEngine

describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new

  end


  describe "#initialize" do
    it "should be a Unit" do
      expect(@siege_engine).to be_a(Unit)
      expect(@siege_engine).to be_an_instance_of(SiegeEngine)
    end

    it "has HP = 400, AP = 50" do
      expect(@siege_engine.health_points).to eq(400)
      expect(@siege_engine.attack_power).to eq(50)
    end

    it "cost 200 gold, 60 lumber, 3 food" do
      expect(@siege_engine.cost[:lumber]).to eq(60)
      expect(@siege_engine.cost[:food]).to eq(3)
    end
  end

  describe "#attack" do
    it "deal 2x of its AP to barrack" do
      barrack = Barracks.new
      expect(barrack).to receive(:damage).with(@siege_engine.attack_power*2)
      @siege_engine.attack!(barrack)
    end

    it "cannot attack other type of Units" do
      footman = Footman.new
      peasant = Peasant.new

      expect(@siege_engine.attack!(footman)).to be_nil
      expect(@siege_engine.attack!(peasant)).to be_nil
    end

    it "can attack other siege_engine normally" do
      siege_engine2 = SiegeEngine.new

      expect(siege_engine2).to receive(:damage).with(@siege_engine.attack_power)
      @siege_engine.attack!(siege_engine2)
    end
  end

end