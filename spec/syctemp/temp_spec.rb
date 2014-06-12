require 'syctemp/temp'
require 'date'

module SycTemp

  describe Temp do

    before do
      @date = Date.new(2014, 3, 31)
      @temp = Temp.new(@date)
    end

    it "shows the date of the following date (e.g. in_1_day)" do
      @temp.in_1_day.should eq @date + 1
      @temp.i1d.should eq @date + 1
    end

    it "shows the date of the previous date (e.g. 1_day_ago)" do
      @temp.back_1_day.should eq @date - 1
      @temp.b1d.should eq @date - 1
    end

    it "shows the date of today plus n days" do
      @temp.in_22_days.should eq @date + 22
      @temp.in22days.should eq @date + 22
    end

    it "shows the date of today minus n days" do
      @temp.back_22_day.should eq @date - 22
      @temp.back22days.should eq @date - 22
    end

    it "shows the date of today plus n weeks" do
      @temp.in_1_week.should eq @date + 7
      @temp.i1w.should eq @date + 7
      @temp.in2weeks.should eq @date + 14
    end

    it "shows the date of today minus n weeks" do
      @temp.back_1_week.should eq @date - 7
      @temp.b1w.should eq @date - 7
      @temp.back2weeks.should eq @date - 14
    end

    it "shows the date of today plus n months" do
      @temp.in_1_month.should eq @date >> 1
      @temp.i1m.should eq @date >> 1
      @temp.in3months.should eq @date >> 3
    end

    it "shows the date of today minus n months" do
      @temp.back_1_month.should eq @date << 1
      @temp.b1m.should eq @date << 1
      @temp.back3months.should eq @date << 3
    end

    it "shows the date of today plus n years" do
      @temp.in_12_years.should eq @date >> 12 * 12
      @temp.i12y.should eq @date >> 12 * 12
      @temp.in12years.should eq @date >> 12 * 12
    end

    it "shows the date of today minus n years" do
      @temp.back_10_years.should eq @date << 10 * 12
      @temp.b10y.should eq @date << 10 * 12
      @temp.back10years.should eq @date << 10 * 12
    end

    it "shows the date of today" do
      @temp.send("today").should eq @date
      @temp.today.should eq @date
      @temp.tod.should eq @date
    end

    it "shows the date of tomorrow" do
      @temp.send("tomorrow").should eq @date + 1
      @temp.tomorrow.should eq @date + 1
      @temp.tom.should eq @date + 1
    end

    it "shows the date of yesterday" do
      @temp.yesterday.should eq @date - 1
      @temp.y.should eq @date - 1
    end

    it "shows the date of a next weekday (e.g. next_monday)" do
      @temp.next_monday.should eq @date + 7
      @temp.next_wednesday.should eq @date + 2
      @temp.nwe.should eq @date + 2
      @temp.NwE.should eq @date + 2
    end

    it "shows the date of a previous weekday (e.g. previous_monday)" do
      @temp.previous_monday.should eq @date - 7
      @temp.previous_wednesday.should eq @date - 5
      @temp.pwe.should eq @date -5
      @temp.PWednesDay.should eq @date -5
      @temp.pReviouSWe.should eq @date -5
    end

    it "shows date of a weekday in n weeks (e.g. monday_in_2_weeks)" do
      @temp.monday_in_2_weeks.should eq @date + 14
      @temp.moi2w.should eq @date + 14
      @temp.tuesday_in_2_weeks.should eq @date + 15
      @temp.tuIN2weE.should eq @date + 15
    end

    it "shows date of a weekday n weeks ago (e.g. monday_2_weeks_ago)" do
      @temp.monday_back_2_weeks.should eq @date - 14
      @temp.moba2we.should eq @date - 14
      @temp.tuesday_back_2_weeks.should eq @date - 13
      @temp.tub2w.should eq @date - 13
    end

    it "shows date of a weekday in n months (e.g. monday_in_1_month)" do
      @temp.monday_in_1_month.should eq @date + 28
      @temp.moi1m.should eq @date + 28
      @temp.wednesday_in_1_month.should eq @date + 30
      @temp.wei1m.should eq @date + 30
    end

    it "shows date of a weekday n months before today" do
      @temp.monday_back_1_month.should eq @date - 35
      @temp.mob1m.should eq @date - 35
      @temp.wednesday_back_1_month.should eq @date - 33
      @temp.weDBA1mO.should eq @date - 33
    end

    it "shows date of a weekday in n years from today" do
      @temp.monday_in_1_year.should eq Date.new(2015, 3, 30)
      @temp.moi1y.should eq Date.new(2015, 3, 30)
    end

    it "shows date of a weekday n years before today" do
      @temp.monday_back_1_year.should eq Date.new(2013, 4, 1)
      @temp.mob1YE.should eq Date.new(2013, 4, 1)
    end
  end

end
