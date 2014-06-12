require 'syctimeleap/time_leap'
require 'date'

module SycTimeleap

  describe TimeLeap do

    before do
      @date = Date.new(2014, 3, 31)
      @time_leap = TimeLeap.new(@date)
    end

    it "shows the date of the following date (e.g. in_1_day)" do
      @time_leap.in_1_day.should eq @date + 1
      @time_leap.i1d.should eq @date + 1
    end

    it "shows the date of the previous date (e.g. 1_day_ago)" do
      @time_leap.back_1_day.should eq @date - 1
      @time_leap.b1d.should eq @date - 1
    end

    it "shows the date of today plus n days" do
      @time_leap.in_22_days.should eq @date + 22
      @time_leap.in22days.should eq @date + 22
    end

    it "shows the date of today minus n days" do
      @time_leap.back_22_day.should eq @date - 22
      @time_leap.back22days.should eq @date - 22
    end

    it "shows the date of today plus n weeks" do
      @time_leap.in_1_week.should eq @date + 7
      @time_leap.i1w.should eq @date + 7
      @time_leap.in2weeks.should eq @date + 14
    end

    it "shows the date of today minus n weeks" do
      @time_leap.back_1_week.should eq @date - 7
      @time_leap.b1w.should eq @date - 7
      @time_leap.back2weeks.should eq @date - 14
    end

    it "shows the date of today plus n months" do
      @time_leap.in_1_month.should eq @date >> 1
      @time_leap.i1m.should eq @date >> 1
      @time_leap.in3months.should eq @date >> 3
    end

    it "shows the date of today minus n months" do
      @time_leap.back_1_month.should eq @date << 1
      @time_leap.b1m.should eq @date << 1
      @time_leap.back3months.should eq @date << 3
    end

    it "shows the date of today plus n years" do
      @time_leap.in_12_years.should eq @date >> 12 * 12
      @time_leap.i12y.should eq @date >> 12 * 12
      @time_leap.in12years.should eq @date >> 12 * 12
    end

    it "shows the date of today minus n years" do
      @time_leap.back_10_years.should eq @date << 10 * 12
      @time_leap.b10y.should eq @date << 10 * 12
      @time_leap.back10years.should eq @date << 10 * 12
    end

    it "shows the date of today" do
      @time_leap.send("today").should eq @date
      @time_leap.today.should eq @date
      @time_leap.tod.should eq @date
    end

    it "shows the date of tomorrow" do
      @time_leap.send("tomorrow").should eq @date + 1
      @time_leap.tomorrow.should eq @date + 1
      @time_leap.tom.should eq @date + 1
    end

    it "shows the date of yesterday" do
      @time_leap.yesterday.should eq @date - 1
      @time_leap.y.should eq @date - 1
    end

    it "shows the date of a next weekday (e.g. next_monday)" do
      @time_leap.next_monday.should eq @date + 7
      @time_leap.next_wednesday.should eq @date + 2
      @time_leap.nwe.should eq @date + 2
      @time_leap.NwE.should eq @date + 2
    end

    it "shows the date of a previous weekday (e.g. previous_monday)" do
      @time_leap.previous_monday.should eq @date - 7
      @time_leap.previous_wednesday.should eq @date - 5
      @time_leap.pwe.should eq @date -5
      @time_leap.PWednesDay.should eq @date -5
      @time_leap.pReviouSWe.should eq @date -5
    end

    it "shows date of a weekday in n weeks (e.g. monday_in_2_weeks)" do
      @time_leap.monday_in_2_weeks.should eq @date + 14
      @time_leap.moi2w.should eq @date + 14
      @time_leap.tuesday_in_2_weeks.should eq @date + 15
      @time_leap.tuIN2weE.should eq @date + 15
    end

    it "shows date of a weekday n weeks ago (e.g. monday_2_weeks_ago)" do
      @time_leap.monday_back_2_weeks.should eq @date - 14
      @time_leap.moba2we.should eq @date - 14
      @time_leap.tuesday_back_2_weeks.should eq @date - 13
      @time_leap.tub2w.should eq @date - 13
    end

    it "shows date of a weekday in n months (e.g. monday_in_1_month)" do
      @time_leap.monday_in_1_month.should eq @date + 28
      @time_leap.moi1m.should eq @date + 28
      @time_leap.wednesday_in_1_month.should eq @date + 30
      @time_leap.wei1m.should eq @date + 30
    end

    it "shows date of a weekday n months before today" do
      @time_leap.monday_back_1_month.should eq @date - 35
      @time_leap.mob1m.should eq @date - 35
      @time_leap.wednesday_back_1_month.should eq @date - 33
      @time_leap.weDBA1mO.should eq @date - 33
    end

    it "shows date of a weekday in n years from today" do
      @time_leap.monday_in_1_year.should eq Date.new(2015, 3, 30)
      @time_leap.moi1y.should eq Date.new(2015, 3, 30)
    end

    it "shows date of a weekday n years before today" do
      @time_leap.monday_back_1_year.should eq Date.new(2013, 4, 1)
      @time_leap.mob1YE.should eq Date.new(2013, 4, 1)
    end
  end

end
