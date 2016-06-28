require_relative 'spec_helper'

#Enhancement

describe Barracks do

  before :each do
    @barrack = Barracks.new
  end

  it "has HP 500 when initialized" do
    expect(@barrack.health_points).to eq(500)
  end

  describe "#damage" do
    it "has method #damage" do
      @barrack.damage(9)
    end

    it "should be able to be attacked by a unit" do
      @barrack.damage(9)
      expect(@barrack.health_points).to eq(491)
    end
  end

end

describe Footman do

  before :each do
    @footman = Footman.new
    @barrack = Barracks.new
  end

  describe "When footman attack Barrack" do

    it "deals only half of its AP to barrack" do
      expect(@barrack).to receive(:damage).with((@footman.attack_power/2).ceil)
      @footman.attack!(@barrack)
    end


  end

end

describe Unit do

  before :each do
    @alive_unit = Unit.new(50, 10)
    @dead_unit = Unit.new(-1, 10)
    @enemy = Unit.new(50, 60)
  end

  describe "#dead?" do
    it "returns true if HP of the unit belows 0" do
      expect(@dead_unit.dead?).to be_truthy
    end
  end

  describe "#attack!" do
    it "cannot attack if the attacking unit is dead" do
      # expect(@enemy).to receive(:damage).with(nil)
      expect(@dead_unit.attack!(@enemy)).to be_nil
    end

    it "cannot attack dead enemy" do
      expect(@enemy.attack!(@dead_unit)).to be_nil

    end
  end

end




