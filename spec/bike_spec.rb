require 'bike'

describe Bike do
	  it "allows to report a broken bike" do
	     subject.report_broken
	     expect(subject).to be_broken
	  end
end
