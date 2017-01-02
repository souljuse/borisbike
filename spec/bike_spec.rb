require 'bike'

describe Bike do
	  it "allows to report a broken bike" do
	     subject.report_broken
	     expect(subject).to be_broken
	  end

describe '#fix_bike' do
		it "should convert bike from broken? true to broken? false" do
			subject.fix_bike
			expect(subject).not_to be_broken
		end
	end
end
