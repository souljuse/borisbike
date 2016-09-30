require 'van'
DEFAULT_CAPACITY = 20
describe Van do
  it { is_expected.to respond_to :unload_bike }
  it { is_expected.to respond_to(:load_bike).with(1).argument }

  #mocking behaviour of the double
  let(:bike) { double :bike }
  it "releases working bikes" do
    bike = double(:bike, broken?: false)
    subject.load_bike bike
    expect(subject.unload_bike).to be bike
  end

  it "loads something" do
    bike = double(:bike)
    expect(subject.load_bike(bike)).to eq [bike]
  end

  describe 'initialization' do
    #we use the Bike.new very often so we store it with a let statement
    it 'defaults capacity' do
      #described_class just refers to the class
      #it's the same as writing loadingStation::DEFAULT_CAPACITY
      described_class::DEFAULT_CAPACITY.times do
        subject.load_bike(bike)
      end
      expect{ subject.load_bike(bike) }.to raise_error 'Van full'
    end
  end

  describe '#unload_bike' do
    it "should not release infinite bikes" do
      expect {subject.unload_bike}.to raise_error ("No bikes on the van")
    end
  end

  describe '#load_bike' do
    it "should not accept more than capacity" do
      subject.capacity.times { subject.load_bike bike }
      expect { subject.load_bike bike }.to raise_error ("Van full")
    end
  end

end
