require 'garage'
DEFAULT_CAPACITY = 20
describe Garage do
  it { is_expected.to respond_to :release_fixed_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }

  #mocking behaviour of the double
  let(:bike) { double :bike }
  it "releases working bikes" do
    bike = double(:bike, broken?: false)
    subject.dock bike
    expect(subject.release_fixed_bike).to be bike
  end

  it "docks something" do
    bike = double(:bike)
    expect(subject.dock(bike)).to eq [bike]
  end

  describe 'initialization' do
    #we use the Bike.new very often so we store it with a let statement
    it 'defaults capacity' do
      #described_class just refers to the class
      #it's the same as writing DockingStation::DEFAULT_CAPACITY
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Garage full'
    end
  end

  describe '#release_fixed_bike' do
    it "should not release infinite bikes" do
      expect {subject.release_fixed_bike}.to raise_error ("Sorry, the garage has no bikes at all.")
    end
    it "should not release a broken bike" do
      bike = double(:bike, broken?: true)
      subject.dock bike
      expect{subject.release_fixed_bike}.to raise_error ("Sorry, there are no fixed bikes.")
    end
  end

  describe '#dock' do
    it "should not accept more than capacity" do
      subject.capacity.times { subject.dock bike }
      expect { subject.dock bike }.to raise_error ("Garage full")
    end
  end

end
