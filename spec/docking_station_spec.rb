require 'docking_station'
DEFAULT_CAPACITY = 20
describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }

  #mocking behaviour of the double
  let(:bike) { double :bike }
  it "releases working bikes" do
    bike = double(:bike, broken?: false)
    subject.dock bike
    expect(subject.release_bike).to be bike
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
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  describe '#release_bike' do
    it "should not release infinite bikes" do
      expect {subject.release_bike}.to raise_error ("Oh no! No bikes available!")
    end
    it "should not release a broken bike" do
      bike = double(:bike, broken?: )
      subject.dock bike
      expect{subject.release_bike}.to raise_error ("Oh no! No bikes available!")
    end
  end

  describe '#dock' do
    it "should not accept more than capacity" do
      subject.capacity.times { subject.dock bike }
      expect { subject.dock bike }.to raise_error ("Docking station full")
    end
  end
end
