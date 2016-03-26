class ReportsController < ApplicationController
    	


  def test

  end

def train
      @csv_table = CSV.open("FinalResult.csv", :headers => true).read
end

end
